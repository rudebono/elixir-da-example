defmodule HanyCluster.Strategy.Epmd do
  @behaviour HanyCluster.Strategy

  @impl true
  def nodes() do
    {:ok, names} = :erl_epmd.names()
    [_name, host] = Node.self() |> Atom.to_charlist() |> :string.split('@')
    Enum.map(names, fn {name, _} -> :"#{name ++ '@' ++ host}" end)
  rescue
    _ -> []
  end
end
