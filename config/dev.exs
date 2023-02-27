import Config

config :hany_cluster, strategy: HanyCluster.Strategy.Epmd

config :hany, Hany.Repo.Local,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "hany_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  port: 5432

config :hany_web, HanyWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "y6D26+l7RT5ZokEQjrYw3BZUnNSKYqRgXGv1eRLfBXtulKARLnQnVikk0lcFkrD3",
  watchers: [esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}],
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"lib/hany_web/(live|views)/.*(ex)$",
      ~r"lib/hany_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :plug_init_mode, :runtime
config :phoenix, :stacktrace_depth, 20

config :livebook, LivebookWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  pubsub_server: Livebook.PubSub,
  server: false
