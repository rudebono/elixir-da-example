defmodule Hany.Repo do
  use Ecto.Repo,
    otp_app: :hany,
    adapter: Ecto.Adapters.Postgres
end
