defmodule HanyCluster.MixProject do
  use Mix.Project

  def project do
    [
      app: :hany_cluster,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application() do
    [
      extra_applications: [:logger, :runtime_tools, :inets, :ssl, :public_key],
      mod: {HanyCluster.Application, []}
    ]
  end

  defp deps() do
    [
      {:jason, "~> 1.3"},
      {:castore, "~> 0.1.17"}
    ]
  end
end
