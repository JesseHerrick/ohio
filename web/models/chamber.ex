defmodule Ohio.Chamber do
  use Ohio.Web, :model
  alias Ohio.Chamber

  schema "chambers" do
    field :name, :string

    has_many :legislators, Ohio.Legislator
    has_many :bills, Ohio.Bill
    has_many :resolutions, Ohio.Resolution
    has_many :committees, Ohio.Committee

    timestamps()
  end

  @doc """
  Returns the House chamber.
  """
  def house do
    chamber = Chamber
    |> where([c], c.name == "House")
    |> Ohio.Repo.one

    if chamber do
      chamber
    else
      build_house()
    end
  end

  @doc """
  Returns the Senate chamber.
  """
  def senate do
    chamber = Chamber
    |> where([c], c.name == "Senate")
    |> Ohio.Repo.one

    if chamber do
      chamber
    else
      build_senate()
    end
  end

  @doc """
  Builds the House.
  """
  def build_house do
    %Chamber{}
    |> Chamber.changeset(%{name: "House"})
    |> Ohio.Repo.insert!
  end

  @doc """
  Builds the House.
  """
  def build_senate do
    %Chamber{}
    |> Chamber.changeset(%{name: "Senate"})
    |> Ohio.Repo.insert!
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
