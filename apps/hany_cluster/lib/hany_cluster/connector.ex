defmodule HanyCluster.Connector do
  use GenServer

  require Logger

  def start_link(strategy) do
    GenServer.start_link(__MODULE__, strategy, name: __MODULE__)
  end

  @impl true
  def init(strategy) do
    :global_group.monitor_nodes(true)
    for node <- strategy.nodes(), do: connect(node)
    loop()
    {:ok, strategy}
  end

  @impl true
  def handle_info({:nodeup, node}, strategy) do
    Logger.info("#{inspect(node)} connected")
    {:noreply, strategy}
  end

  @impl true
  def handle_info({:nodedown, node}, strategy) do
    Logger.info("#{inspect(node)} disconnected")
    {:noreply, strategy}
  end

  @impl true
  def handle_info(:loop, strategy) do
    for node <- strategy.nodes(), do: connect(node)
    loop()
    {:noreply, strategy}
  end

  defp connect(node) do
    if node not in [Node.self() | Node.list(:connected)], do: Node.connect(node)
  end

  defp loop() do
    Process.send_after(__MODULE__, :loop, 3_000)
  end
end
