defmodule Ohio.BillController do
  use Ohio.Web, :controller

  alias Ohio.Bill

  def index(conn, _params) do
    bills = Repo.all(Bill)
    render(conn, "index.html", bills: bills)
  end

  def new(conn, _params) do
    changeset = Bill.changeset(%Bill{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bill" => bill_params}) do
    changeset = Bill.changeset(%Bill{}, bill_params)

    case Repo.insert(changeset) do
      {:ok, _bill} ->
        conn
        |> put_flash(:info, "Bill created successfully.")
        |> redirect(to: bill_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bill = Repo.get!(Bill, id)
    render(conn, "show.html", bill: bill)
  end

  def edit(conn, %{"id" => id}) do
    bill = Repo.get!(Bill, id)
    changeset = Bill.changeset(bill)
    render(conn, "edit.html", bill: bill, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bill" => bill_params}) do
    bill = Repo.get!(Bill, id)
    changeset = Bill.changeset(bill, bill_params)

    case Repo.update(changeset) do
      {:ok, bill} ->
        conn
        |> put_flash(:info, "Bill updated successfully.")
        |> redirect(to: bill_path(conn, :show, bill))
      {:error, changeset} ->
        render(conn, "edit.html", bill: bill, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bill = Repo.get!(Bill, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(bill)

    conn
    |> put_flash(:info, "Bill deleted successfully.")
    |> redirect(to: bill_path(conn, :index))
  end
end
