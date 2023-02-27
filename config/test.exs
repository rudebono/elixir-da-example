import Config

config :hany_cluster, strategy: HanyCluster.Strategy.Epmd

config :hany, Hany.Repo.Local,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "hany_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10,
  port: 5432

config :hany_web, HanyWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4001],
  secret_key_base: "G1W9Xa9RI016nDE8izj9Qr6GiLhUL8iVF69BLWuMXHwrvhkLL6bVzi9u+IRlOI4w",
  server: false

config :logger, level: :warn

config :phoenix, :plug_init_mode, :runtime

config :livebook, LivebookWeb.Endpoint, server: false

config :livebook, LivebookWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  pubsub_server: Livebook.PubSub,
  server: false
