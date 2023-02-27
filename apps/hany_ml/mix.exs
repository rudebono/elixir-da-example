defmodule HanyMl.MixProject do
  use Mix.Project

  def project() do
    [
      app: :hany_ml,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application() do
    [
      extra_applications: [:logger],
      mod: {HanyMl.Application, []}
    ]
  end

  defp deps() do
    [
      {:hany_cluster, in_umbrella: true, runtime: true},
      {:bumblebee, "~> 0.1.2"},
      {:exla, ">= 0.0.0"}
    ]
  end

  defp aliases() do
    [
      setup: ["deps.get"],
      "release.setup": []
    ]
  end
end
