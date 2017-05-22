defmodule Ohio.Legislator do
  use Ohio.Web, :model

  schema "legislators" do
    has_many :assignments, Ohio.Assignment
    belongs_to :chamber, Ohio.Chamber

    field :firstname, :string
    field :lastname, :string
    field :lpid, :string
    field :district, :string
    field :med_id, :integer
    field :position, :string
    field :displayname, :string
    field :sponsorname, :string
    field :aemembsponsor, :string
    field :revno, :string
    field :apn, :string
    field :active, :boolean, default: false
    field :api_link, :string
    field :partyid, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firstname, :lastname, :lpid, :district, :med_id, :position, :displayname, :sponsorname, :aemembsponsor, :revno, :apn, :active, :api_link, :partyid])
    |> validate_required([:firstname, :lastname, :lpid, :district, :med_id, :position, :displayname, :sponsorname, :aemembsponsor, :revno, :apn, :active, :api_link, :partyid])
  end
end
