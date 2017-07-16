defmodule Ohio.ChamberTest do
  use Ohio.ModelCase

  alias Ohio.Chamber
  alias Ohio.Repo

  test ".house/1 should build the House if it does not exist" do
    assert Chamber |> Repo.get_by(name: "House") == nil
    refute Chamber.house == nil
    refute Chamber |> Repo.get_by(name: "House") == nil
  end

  test ".senate/1 should build the Senate if it does not exist" do
    assert Chamber |> Repo.get_by(name: "Senate") == nil
    refute Chamber.senate == nil
    refute Chamber |> Repo.get_by(name: "Senate") == nil
  end

  test "there may not be two chambers of the same name" do
    Chamber.changeset(%Chamber{}, %{name: "House"}) |> Repo.insert
    result = Chamber.changeset(%Chamber{}, %{name: "House"}) |> Repo.insert

    assert {:error, _} = result
  end
end
