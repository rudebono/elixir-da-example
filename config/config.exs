import Config

config :hany, ecto_repos: [Hany.Repo.Local]

config :hany, Hany.Repo.Local, priv: "priv/repo"

config :hany_web,
  ecto_repos: [Hany.Repo.Local],
  generators: [context_app: :hany]

config :hany_web, HanyWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: HanyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hany.PubSub,
  live_view: [signing_salt: "XzNU9OtT"]

config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/hany_web/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
