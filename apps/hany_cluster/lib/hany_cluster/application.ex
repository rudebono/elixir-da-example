defmodule HanyCluster.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [{HanyCluster.Connector, Application.get_env(:hany_cluster, :strategy)}]
    |> Supervisor.start_link(strategy: :one_for_one, name: __MODULE__)
  end
end
