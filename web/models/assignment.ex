defmodule Ohio.Assignment do
  use Ohio.Web, :model

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
    |> cast(params, [])
    |> validate_required([])
  end
end
