defmodule Ohio.VoteTest do
  use Ohio.ModelCase

  alias Ohio.Vote

  @valid_attrs %{aye: 42, nay: 42, passed: true, revno: "some content", source_id: "some content", type: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Vote.changeset(%Vote{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vote.changeset(%Vote{}, @invalid_attrs)
    refute changeset.valid?
  end
end
