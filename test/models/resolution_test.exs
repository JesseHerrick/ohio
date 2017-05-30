defmodule Ohio.ResolutionTest do
  use Ohio.ModelCase

  alias Ohio.Resolution
  alias Ohio.Repo

  test "can create a House resolution" do
    assert {:ok, res} = build(:house_resolution)
    |> Repo.insert

    assert res.chamber.name == "House"
  end

  test "can create a Senate resolution" do
    assert {:ok, res} = build(:house_resolution)
    |> Repo.insert

    assert res.chamber.name == "Senate"
  end
end
