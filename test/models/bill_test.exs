defmodule Ohio.BillTest do
  use Ohio.ModelCase

  alias Ohio.Bill

  # @valid_attrs %{api_link: "some content", apn: "some content", chamber: "some content", concurrence: "some content", effective_date: "some content", effective_date_notes: "some content", formatted_ver: "some content", govsigned: "some content", html_download_link: "some content", local_impact_statement: "some content", long_title: "some content", name: "some content", number: "some content", pdf_download_link: "some content", revno: 42, short_title: "some content", version: "some content", version_id: "some content"}
  # @invalid_attrs %{}

  # test "changeset with valid attributes" do
  #   changeset = Bill.changeset(%Bill{}, @valid_attrs)
  #   assert changeset.valid?
  # end

  # test "changeset with invalid attributes" do
  #   changeset = Bill.changeset(%Bill{}, @invalid_attrs)
  #   refute changeset.valid?
  # end

  import Ohio.Factory
  require IEx

  test "can create a bill" do
    bill = insert(:house_bill)
    IEx.pry
  end
end
