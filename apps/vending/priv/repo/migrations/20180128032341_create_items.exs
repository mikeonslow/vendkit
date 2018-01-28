defmodule Vending.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add(:mfg_id, :integer)
      add(:sku, :string)
      add(:name, :string)
      add(:description, :string)
      add(:size, :decimal)
      add(:size_unit_id, :integer)
      add(:price, :decimal)
      add(:inserted_by, :integer)
      add(:updated_by, :integer)
      add(:deleted_at, :utc_datetime)
      add(:deleted_by, :integer)

      timestamps()
    end
  end
end
