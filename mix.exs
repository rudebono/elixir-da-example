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
      {:livebook, "~> 0.8.1"},
      {:nx, "~> 0.4.1"},
      {:exla, "~> 0.4.1"},
      {:kino, "~> 0.8.0"}
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
          livebook: :load,
          hany: :permanent,
          hany_cluster: :permanent,
          hany_ml: :load,
          hany_web: :load
        ]
      ],
      hany_web: [
        include_executables_for: [:unix],
        applications: [
          livebook: :load,
          hany: :load,
          hany_cluster: :permanent,
          hany_ml: :load,
          hany_web: :permanent
        ]
      ],
      hany_ml: [
        include_executables_for: [:unix],
        applications: [
          livebook: :load,
          hany: :load,
          hany_cluster: :permanent,
          hany_ml: :permanent,
          hany_web: :load
        ]
      ],
      hany_livebook: [
        include_executables_for: [:unix],
        applications: [
          livebook: :permanent,
          nx: :permanent,
          exla: :permanent,
          kino: :permanent,
          hany: :load,
          hany_cluster: :permanent,
          hany_ml: :load,
          hany_web: :load
        ]
      ]
    ]
  end
end
