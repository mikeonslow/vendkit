defmodule Vending.Tasks.Item do
  import Ecto.Query

  alias Vending.{Repo}

  @userId 111
  @mfgId 1

  def list() do
    Item
    |> order_by([i, _], i.name)
    |> Repo.all()
  end

  def test_save(id) do
    :item
    |> Repo.save(%{
      id: id,
      mfg_id: @mfgId,
      name: "Test Item 2",
      description: "Test Item Description",
      inserted_by: @userId,
      price: 1.50,
      size: 1.00,
      size_unit_id: 1,
      sku: "54SKU76TEST",
      updated_by: @userId
    })
  end

  def test_delete(id) do
    :item |> Repo.delete(id, %{userId: @userId})
  end
end
