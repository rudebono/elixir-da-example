defmodule Hany.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [
      Hany.Repo.Local,
      Hany.Repo.Migrator,
      {Phoenix.PubSub, name: Hany.PubSub}
    ]
    |> Supervisor.start_link(strategy: :one_for_one, name: __MODULE__)
  end
end
