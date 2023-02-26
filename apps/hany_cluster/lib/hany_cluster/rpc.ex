defmodule HanyCluster.Rpc do
  def call(module, function, args) do
    application = Application.get_application(module)

    if HanyCluster.is_started_application(application) do
      apply(module, function, args)
    else
      application
      |> HanyCluster.find_node()
      |> :rpc.call(module, function, args)
    end
  end
end
