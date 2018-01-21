defmodule VendkitEngTest do
  use ExUnit.Case
  doctest VendkitEng

  test "greets the world" do
    assert VendkitEng.hello() == :world
  end
end
