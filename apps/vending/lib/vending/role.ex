defmodule Vending.Role do
  use Ecto.Schema
  import Ecto.Changeset
  alias Vending.Role

  schema "roles" do
    field(:deleted_at, :utc_datetime)
    field(:deleted_by, :integer)
    field(:inserted_by, :integer)
    field(:name, :string)
    field(:permissions, :string)
    field(:updated_by, :integer)

    timestamps()
  end

  @doc false
  def changeset(%Role{} = role, attrs) do
    role
    |> cast(attrs, [:name, :permissions, :inserted_by, :updated_by, :deleted_at, :deleted_by])
    |> validate_required([
      :name,
      :permissions,
      :inserted_by,
      :updated_by,
      :deleted_at,
      :deleted_by
    ])
  end
end
