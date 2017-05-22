defmodule Ohio.LegislatorTest do
  use Ohio.ModelCase

  alias Ohio.Legislator

  @valid_attrs %{active: true, aemembsponsor: "some content", api_link: "some content", apn: "some content", committees: "some content", displayname: "some content", district: "some content", firstname: "some content", lastname: "some content", lpid: "some content", med_id: 42, partyid: "some content", position: "some content", revno: "some content", sponsorname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Legislator.changeset(%Legislator{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Legislator.changeset(%Legislator{}, @invalid_attrs)
    refute changeset.valid?
  end
end
