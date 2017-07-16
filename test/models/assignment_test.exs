defmodule Ohio.AssignmentTest do
  use Ohio.ModelCase

  alias Ohio.Assignment
  alias Ohio.Repo

  test "a legislator may not be assigned twice to a committee" do
    house = Ohio.Chamber.house
    committee = insert(:house_committee, chamber: house)
    legislator = insert(:house_legislator)

    assert {:ok, _} = %Ohio.Assignment{}
    |> Ohio.Assignment.changeset(
      %{
        legislator_id: legislator.id,
        committee_id: committee.id
      }
    )
    |> Repo.insert

    refute Repo.all(Ohio.Assignment) == []

    assert {:error, _} = %Ohio.Assignment{}
    |> Ohio.Assignment.changeset(
      %{
        legislator_id: legislator.id,
        committee_id: committee.id
      }
    )
    |> Repo.insert
  end
end
