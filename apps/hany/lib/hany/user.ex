defmodule Hany.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
  end
end
