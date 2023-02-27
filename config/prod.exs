import Config

config :hany_cluster, strategy: HanyCluster.Strategy.Gce

config :hany_web, HanyWeb.Endpoint,
  url: [scheme: "https", host: "da.rudebono.dev", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: false,
  server: true

config :logger, level: :info

config :livebook, LivebookWeb.Endpoint,
  url: [scheme: "https", host: "livebook.rudebono.dev", port: 443, path: "/"],
  http: [ip: {0, 0, 0, 0, 0, 0, 0, 0}, port: 4002],
  check_origin: false,
  server: true
