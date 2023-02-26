defmodule HanyCluster.Strategy do
  @callback nodes() :: [node()] | []
end
