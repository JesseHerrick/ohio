defmodule Ohio.Assignment do
  @moduledoc """
  Map table for committee assignments.

  Has one legislator and one committee, but a legislator can
  be on multiple committees.
  """

  use Ohio.Web, :model
  alias Ohio.Repo
  import Ecto.Query

  schema "assignments" do
    belongs_to :legislator, Ohio.Legislator
    belongs_to :committee, Ohio.Committee

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:legislator_id, :committee_id])
    |> validate_required([:legislator_id, :committee_id])
    |> unique_constraint(:legislator_and_committee_not_unique, name: :legislator_committee_key)
  end
end
