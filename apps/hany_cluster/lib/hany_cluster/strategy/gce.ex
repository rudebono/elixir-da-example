defmodule HanyCluster.Strategy.Gce do
  @behaviour HanyCluster.Strategy

  @cacerts CAStore.file_path()
           |> File.read!()
           |> :public_key.pem_decode()
           |> Enum.map(fn {:Certificate, der, _} -> der end)

  @impl true
  def nodes() do
    {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, project_id}} =
      :httpc.request(
        :get,
        {
          "http://metadata.google.internal/computeMetadata/v1/project/project-id",
          [{'Metadata-Flavor', 'Google'}, {'content-type', 'application/text'}]
        },
        [],
        [{:body_format, :binary}]
      )

    {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} =
      :httpc.request(
        :get,
        {
          "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token",
          [{'Metadata-Flavor', 'Google'}, {'content-type', 'application/json'}]
        },
        [],
        [{:body_format, :binary}]
      )

    {:ok, %{"access_token" => access_token, "token_type" => token_type}} = Jason.decode(body)

    {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} =
      :httpc.request(
        :get,
        {
          "https://compute.googleapis.com/compute/v1/projects/#{project_id}/aggregated/instances",
          [
            {'Authorization', '#{token_type} #{access_token}'},
            {'content-type', 'application/json'}
          ]
        },
        [
          {:ssl,
           [
             {:verify, :verify_peer},
             {:cacerts, @cacerts},
             {:customize_hostname_check,
              [{:match_fun, :public_key.pkix_verify_hostname_match_fun(:https)}]}
           ]}
        ],
        [{:body_format, :binary}]
      )

    [name, _host] =
      Node.self()
      |> Atom.to_charlist()
      |> :string.split('@')

    {:ok, %{"items" => items}} = Jason.decode(body)

    items
    |> Enum.filter(fn
      {_zone, %{"instances" => [_ | _]}} -> true
      {_zone, _} -> false
    end)
    |> Enum.reduce([], fn {_zone, %{"instances" => instances}}, acc -> acc ++ instances end)
    |> Enum.map(fn %{"selfLink" => self_link} -> URI.parse(self_link) end)
    |> Enum.map(fn %URI{path: path} -> Path.split(path) end)
    |> Enum.map(fn [
                     "/",
                     "compute",
                     "v1",
                     "projects",
                     project_id,
                     "zones",
                     zone,
                     "instances",
                     instance
                   ] ->
      :"#{name}@#{instance}.#{zone}.c.#{project_id}.internal"
    end)
  rescue
    _ -> []
  end
end
