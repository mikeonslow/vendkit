defmodule Vending.EnumCode do
  use Ecto.Schema
  import Ecto.Changeset
  alias Vending.EnumCode

  schema "enum_codes" do
    field(:code, :string)
    field(:deleted_by, :integer)
    field(:description, :string)
    field(:inserted_by, :integer)
    field(:updated_by, :integer)

    belongs_to(:enum_source, Vending.EnumSource, foreign_key: :source_id, references: :id)

    timestamps()
  end

  @doc false
  def changeset(%EnumCode{} = enum_codes, attrs) do
    enum_codes
    |> cast(attrs, [
      :source_id,
      :code,
      :description,
      :inserted_by,
      :updated_by,
      :deleted_at,
      :deleted_by
    ])
    |> validate_required([:source_id, :code, :description])
  end
end
