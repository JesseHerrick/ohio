defmodule Ohio.Chamber do
  use Ohio.Web, :model

  schema "chambers" do
    field :name, :string

    has_many :legislators, Ohio.Legislator
    has_many :bills, Ohio.Bill
    has_many :resolutions, Ohio.Resolution
    has_many :committees, Ohio.Committee

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
