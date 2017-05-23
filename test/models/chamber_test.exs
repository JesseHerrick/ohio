defmodule Ohio.ChamberTest do
  use Ohio.ModelCase

  alias Ohio.Chamber
  alias Ohio.Repo

  import Ohio.Factory

  test "there may not be two chambers of the same name" do
    Chamber.changeset(%Chamber{}, %{name: "House"}) |> Repo.insert
    result = Chamber.changeset(%Chamber{}, %{name: "House"}) |> Repo.insert
    IO.puts result
  end
end
