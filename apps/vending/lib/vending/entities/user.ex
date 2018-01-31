defmodule Vending.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Vending.User

  schema "users" do
    field(:deleted_by, :integer)
    field(:deleted_at, :utc_datetime)
    field(:email, :string)
    field(:first_name, :string)
    field(:inserted_by, :integer)
    field(:last_name, :string)
    field(:password_hash, :string)
    field(:role_id, :integer)
    field(:updated_by, :integer)
    field(:user_name, :string)

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [
      :email,
      :password_hash,
      :first_name,
      :last_name,
      :inserted_by,
      :updated_by,
      :deleted_by,
      :role_id
    ])
    |> validate_required([
      :email,
      :password_hash,
      :first_name,
      :last_name,
      :inserted_by,
      :updated_by,
      :role_id
    ])
    |> unique_constraint(:email)
  end
end
