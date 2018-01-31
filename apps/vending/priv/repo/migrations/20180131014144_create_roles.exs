defmodule Vending.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add(:name, :string)
      add(:permissions, :string)
      add(:inserted_by, :integer)
      add(:updated_by, :integer)
      add(:deleted_at, :utc_datetime)
      add(:deleted_by, :integer)

      timestamps()
    end
  end
end
