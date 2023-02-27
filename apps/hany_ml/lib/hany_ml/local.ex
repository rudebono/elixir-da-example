defmodule HanyMl.Local do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @impl true
  def init(_) do
    {:ok, resnet} = Bumblebee.load_model({:hf, "microsoft/resnet-50"})
    {:ok, featurizer} = Bumblebee.load_featurizer({:hf, "microsoft/resnet-50"})
    {:ok, Bumblebee.Vision.image_classification(resnet, featurizer)}
  end

  @impl true
  def handle_call({:run, image}, _from, serving) do
    {:reply, Nx.Serving.run(serving, image), serving}
  end

  def run(image) do
    GenServer.call(__MODULE__, {:run, image})
  end
end
