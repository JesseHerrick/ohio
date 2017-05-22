defmodule Ohio.ResolutionTest do
  use Ohio.ModelCase

  alias Ohio.Resolution

  @valid_attrs %{api_link: "some content", apn: "some content", chamber: "some content", concurrence: "some content", effective_date: "some content", effective_date_notes: "some content", formatted_ver: "some content", govsigned: "some content", html_download_link: "some content", long_title: "some content", name: "some content", number: "some content", pdf_download_link: "some content", revno: 42, short_title: "some content", trackingno: "some content", type: "some content", version: "some content", version_id: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Resolution.changeset(%Resolution{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Resolution.changeset(%Resolution{}, @invalid_attrs)
    refute changeset.valid?
  end
end
