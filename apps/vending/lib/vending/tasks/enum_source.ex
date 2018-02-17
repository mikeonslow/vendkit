defmodule Vending.Tasks.EnumSource do
  import Ecto.Query

  alias Vending.{Repo, EnumSource}

  def list(source_code) do
    EnumCode
    |> join(:left, [c], s in assoc(c, :enum_source))
    |> where([_, s], s.sCode == ^source_code)
    |> order_by([c, _], c.iOrder)
    |> Repo.all()
  end

  def save(%{id: id} = changes) do
    result =
      case Repo.get(EnumSource, id) do
        nil ->
          %EnumSource{id: id}

        # Post exists, let's use it
        enumSource ->
          enumSource
      end
      |> EnumSource.changeset(changes)
      |> Repo.insert_or_update()

    case result do
      {:ok, model} -> "Inserted or updated with success"
      {:error, changeset} -> "Something went wrong"
    end
  end
end
