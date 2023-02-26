import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :hany, Hany.Repo.Local,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "hany_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :hany_cluster, strategy: HanyCluster.Strategy.Epmd

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hany_web, HanyWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "G1W9Xa9RI016nDE8izj9Qr6GiLhUL8iVF69BLWuMXHwrvhkLL6bVzi9u+IRlOI4w",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :livebook, LivebookWeb.Endpoint, server: false
