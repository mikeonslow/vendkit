defmodule Vending.Model do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset
      import Ecto.Query

      alias Vending.{
        EnumSource,
        EnumCode,
        Item,
        Role,
        User
      }
    end
  end
end
