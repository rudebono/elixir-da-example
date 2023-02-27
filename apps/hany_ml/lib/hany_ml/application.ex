defmodule HanyMl.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [HanyMl.Local]
    |> Supervisor.start_link(strategy: :one_for_one, name: __MODULE__)
  end
end
