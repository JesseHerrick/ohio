defmodule Ohio.AssignmentTest do
  use Ohio.ModelCase

  alias Ohio.Assignment

  test "Assignment.find_by_committee/1 can find all legislators on a particular committee" do
    committee = insert(:committee)

    # Makes a new legislator and assigns them to the committee, `committee`.
    legislators_on_committee = [
      insert(:assignment, committee: committee).legislator,
      insert(:assignment, committee: committee).legislator,
      insert(:assignment, committee: committee).legislator,
      insert(:assignment, committee: committee).legislator,
      insert(:assignment, committee: committee).legislator
    ]

      # Should return a list of legislators on the committee.
      assert] Assignment.find_by_committee(committee.id) == legislators_on_committee
  end

  test "Assignment.find_by_legislator/1 can find all committees assigned to a particular legislator" do
    legislator = insert(:legislator)

    # Makes a new committee and assigns our `legislator` to it.
    committees_assigned_to_legislator = [
      insert(:assignment, legislator: legislator).committee,
      insert(:assignment, legislator: legislator).committee,
      insert(:assignment, legislator: legislator).committee,
      insert(:assignment, legislator: legislator).committee,
      insert(:assignment, legislator: legislator).committee
    ]


    assert Assignment.find_by_legislator(legislator.id) == committees_assigned_to_legislator
  end
end
