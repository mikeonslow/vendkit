defmodule Vending.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Vending.Item

  schema "items" do
    field(:deleted_at, :utc_datetime)
    field(:deleted_by, :integer)
    field(:description, :string)
    field(:inserted_by, :integer)
    field(:mfg_id, :integer)
    field(:name, :string)
    field(:price, :decimal)
    field(:size, :decimal)
    field(:size_unit_id, :integer)
    field(:sku, :string)
    field(:updated_by, :integer)

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [
      :mfg_id,
      :sku,
      :name,
      :description,
      :size,
      :size_unit_id,
      :price,
      :inserted_by,
      :updated_by,
      :deleted_at,
      :deleted_by
    ])
    |> validate_required([
      :mfg_id,
      :sku,
      :name,
      :description,
      :size,
      :size_unit_id,
      :price,
      :inserted_by,
      :updated_by,
      :deleted_at,
      :deleted_by
    ])
  end
end
