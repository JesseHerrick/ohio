defmodule Ohio.BillTest do
  use Ohio.ModelCase
  import Ohio.Factory

  alias Ohio.Bill
  alias Ohio.Repo

  test "bill factory creates a valid house bill" do
    assert {:ok, bill} = build(:house_bill)
    |> Repo.insert

    assert bill.chamber.name == "House"
  end

  test "bill factory creates a valid senate bill" do
    assert {:ok, bill} = build(:senate_bill)
    |> Repo.insert

    assert bill.chamber.name == "Senate"
  end

  test "cannot create a bill without a chamber" do
    refute Bill.changeset(%Bill{}, params_for(:house_bill, chamber_id: nil)).valid?
  end
end
