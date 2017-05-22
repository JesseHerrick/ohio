defmodule Ohio.ChamberTest do
  use Ohio.ModelCase

  alias Ohio.Chamber

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Chamber.changeset(%Chamber{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Chamber.changeset(%Chamber{}, @invalid_attrs)
    refute changeset.valid?
  end
end
