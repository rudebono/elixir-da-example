defmodule Hany.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      releases: releases()
    ]
  end

  defp deps() do
    [
      {:livebook, "~> 0.8.1"}
    ]
  end

  defp aliases() do
    [
      setup: ["cmd mix setup"],
      "release.setup": ["cmd mix release.setup"],
      "ecto.reset": ["cmd --app hany mix ecto.reset"]
    ]
  end

  defp releases() do
    [
      hany: [
        include_executables_for: [:unix],
        applications: [
          hany: :permanent,
          hany_cluster: :permanent
        ]
      ],
      hany_web: [
        include_executables_for: [:unix],
        applications: [
          hany: :load,
          hany_cluster: :permanent,
          hany_web: :permanent
        ]
      ],
      hany_livebook: [
        include_executables_for: [:unix],
        applications: [
          livebook: :permanent,
          hany: :load,
          hany_cluster: :permanent,
          hany_web: :load
        ]
      ]
    ]
  end
end
