defmodule Hany.Repo.Local do
  use Ecto.Repo, otp_app: :hany, adapter: Ecto.Adapters.Postgres

  def migrate() do
    application = Application.get_application(__MODULE__)
    path = Application.app_dir(application, Application.get_env(application, __MODULE__)[:priv])
    versions = Ecto.Migrator.run(__MODULE__, path, :up, all: true)
    {:ok, versions}
  end
end
