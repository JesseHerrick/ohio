defmodule Ohio.BillTest do
  use Ohio.ModelCase
  import Ohio.Factory

  alias Ohio.Bill
  alias Ohio.Repo

  test "bill factory creates a valid bill" do
    assert {:ok, bill} = build(:house_bill)
    |> Repo.insert
  end

  test "cannot create a bill without a chamber" do
    refute Bill.changeset(%Bill{}, params_for(:house_bill, chamber_id: nil)).valid?
  end
end
