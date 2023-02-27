defmodule HanyMl do
  alias HanyCluster.Rpc

  def run(image) do
    __MODULE__.__exec__(:run, [image])
  end

  def __exec__(func, args) do
    Rpc.call(__MODULE__.Local, func, args)
  end
end
