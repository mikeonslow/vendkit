defmodule Vending.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string)
      add(:password_hash, :string)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:user_name, :string)
      add(:inserted_by, :integer)
      add(:updated_by, :integer)
      add(:deleted_at, :utc_datetime)
      add(:deleted_by, :integer)
      add(:role_id, :integer)

      timestamps()
    end
  end
end
