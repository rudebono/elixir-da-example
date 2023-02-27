import Config

if config_env() == :prod do
  Livebook.config_runtime()

  config :hany, Hany.Repo.Local,
    username: System.get_env("PG_USERNAME", "postgres"),
    password: System.get_env("PG_PASSWORD", "postgres"),
    hostname: System.get_env("PG_HOSATNAME", "localhost"),
    database: "hany_prod",
    port: String.to_integer(System.get_env("PG_PORT", "5432"))

  config :hany_web, HanyWeb.Endpoint,
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: String.to_integer(System.get_env("HANYWEB_PORT", "4000"))
    ],
    secret_key_base:
      System.get_env(
        "SECRET_KEY_BASE",
        "y6D26+l7RT5ZokEQjrYw3BZUnNSKYqRgXGv1eRLfBXtulKARLnQnVikk0lcFkrD3"
      )

  config :livebook, LivebookWeb.Endpoint,
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: String.to_integer(System.get_env("LIVEBOOK_PORT", "4002"))
    ],
    secret_key_base:
      System.get_env(
        "SECRET_KEY_BASE",
        "y6D26+l7RT5ZokEQjrYw3BZUnNSKYqRgXGv1eRLfBXtulKARLnQnVikk0lcFkrD3"
      )
end
