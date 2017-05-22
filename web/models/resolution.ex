defmodule Ohio.Resolution do
  use Ohio.Web, :model

  schema "resolutions" do
    belongs_to :chamber, Ohio.Chamber

    field :name, :string
    field :number, :string
    field :trackingno, :string
    field :short_title, :string
    field :long_title, :string
    field :version, :string
    field :version_id, :string
    field :type, :string
    field :revno, :integer
    field :formatted_ver, :string
    field :apn, :string
    field :govsigned, :string
    field :concurrence, :string
    field :effective_date, :string
    field :effective_date_notes, :string
    field :api_link, :string
    field :pdf_download_link, :string
    field :html_download_link, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :chamber_id, :number, :trackingno, :short_title, :long_title, :version, :version_id, :type, :revno, :formatted_ver, :apn, :govsigned, :concurrence, :effective_date, :effective_date_notes, :api_link, :pdf_download_link, :html_download_link])
    |> validate_required([:name, :chamber_id, :number, :trackingno, :short_title, :long_title, :version, :version_id, :type, :revno, :formatted_ver, :apn, :govsigned, :concurrence, :effective_date, :effective_date_notes, :api_link, :pdf_download_link, :html_download_link])
  end
end
