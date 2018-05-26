defmodule Vending.Repo do
  use Ecto.Repo, otp_app: :vending
  use Vending.Model
  @map %{item: Item}

  @doc ~S"""
  Wraps Ecto.Repo's insert_or_update/1

  ## Examples

      iex> ""
      ""

  """

  def save(entity, %{id: id} = changes) do
    entity
    |> item_exists?(id)
    |> @map[entity].changeset(changes)
    |> insert_or_update()
    |> handle_result(entity, id)
  end

  @doc ~S"""
  Wraps Ecto.Repo's insert_or_update/1

  ## Examples

      iex> ""
      ""

  """

  def delete(entity, id, meta) do
    with {:ok, record} <- item_exists?(entity, id),
         {:ok, model} <- record,
         changeset_for_delete(meta.userId)
         |> @map[entity].changeset()
         |> update() do
      "Inserted or updated with success #{inspect(model)}"
    else
      result -> handle_result(result, entity, id)
    end
  end

  defp item_exists?(entity, id) do
    case get(@map[entity], id) do
      nil ->
        {:not_found, @map[entity].__struct__}

      data ->
        {:ok, data}
    end
  end

  defp handle_result(result, entity, id) do
    case result do
      {:error, changeset} ->
        {:error, changeset, "Error saving changeset #{inspect(changeset)}"}

      {:not_found, default} ->
        {:not_found, default, "Record not found for entity (#{entity}) with id (#{id})"}

      err ->
        {:error, inspect(err), "Unknown error"}
    end
  end

  defp changeset_for_delete(userId) do
    %{deleted_by: userId, deleted_at: DateTime.utc_now()}
  end
end
