defmodule Hany.Repo.Migrator do
  use GenServer

  def start_link(_arguments) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_arguments) do
    # For Master <-> Read Replica PostgreSQL Nodes
    # case HanyCluster.is_primary_region() do
    #   true -> Hany.Repo.Local.migrate()
    #   false -> {:ok, []}
    # end
    Hany.Repo.Local.migrate()
  end
end
