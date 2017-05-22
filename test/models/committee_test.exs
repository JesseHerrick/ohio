defmodule Ohio.CommitteeTest do
  use Ohio.ModelCase

  alias Ohio.Committee

  @valid_attrs %{active: true, api_link: "some content", apn: "some content", name: "some content", revno: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Committee.changeset(%Committee{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Committee.changeset(%Committee{}, @invalid_attrs)
    refute changeset.valid?
  end
end
