defmodule Ohio.Vote do
  use Ohio.Web, :model

  schema "votes" do
    field :type, :integer
    field :passed, :boolean, default: false
    field :aye, :integer
    field :nay, :integer
    field :source_id, :string
    field :revno, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:type, :passed, :aye, :nay, :source_id, :revno])
    |> validate_required([:type, :passed, :aye, :nay, :source_id, :revno])
  end
end
