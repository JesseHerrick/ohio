defmodule Ohio.AssignmentTest do
  use Ohio.ModelCase

  alias Ohio.Assignment

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Assignment.changeset(%Assignment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Assignment.changeset(%Assignment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
