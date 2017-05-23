defmodule Ohio.Committee do
  use Ohio.Web, :model

  schema "committees" do
    field :name, :string
    field :revno, :integer
    field :apn, :string
    field :active, :boolean, default: false
    field :api_link, :string

    belongs_to :chamber, Ohio.Chamber
    has_many :assignments, Ohio.Assignment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :revno, :apn, :active, :api_link])
    |> validate_required([:name, :revno, :apn, :active, :api_link])
  end
end