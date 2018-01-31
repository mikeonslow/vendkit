defmodule Vending.Repo.Migrations.CreateEnumCodes do
  use Ecto.Migration

  def change do
    create table(:enum_codes) do
      add(:source_id, :integer)
      add(:code, :string)
      add(:description, :string)
      add(:inserted_by, :integer)
      add(:updated_by, :integer)
      add(:deleted_at, :utc_datetime)
      add(:deleted_by, :integer)

      timestamps()
    end
  end
end
