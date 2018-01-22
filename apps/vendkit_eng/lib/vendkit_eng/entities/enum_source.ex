defmodule VendkitEng.EnumSource do
  use Ecto.Schema
  import Ecto.Changeset
  alias VendkitEng.EnumSource


  schema "enum_sources" do

    field :code, :string
    field :deleted_by, :integer
    field :description, :string
    field :inserted_by, :integer
    field :updated_by, :integer

    has_many :enum_codes, CbsEng.EnumCode, foreign_key: :source_id, references: :id

    timestamps()
  end

  @doc false
  def changeset(%EnumSource{} = enum_sources, attrs) do
    enum_sources
    |> cast(attrs, [:code, :description, :inserted_by, :updated_by, :deleted_at, :deleted_by])
    |> validate_required([:code, :description])
  end
end
