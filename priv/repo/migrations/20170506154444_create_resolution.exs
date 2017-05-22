defmodule Ohio.Repo.Migrations.CreateResolution do
  use Ecto.Migration

  def change do
    create table(:resolutions) do
      add :name, :string
      add :number, :string
      add :trackingno, :string
      add :short_title, :string
      add :long_title, :string
      add :version, :string
      add :version_id, :string
      add :type, :string
      add :revno, :integer
      add :formatted_ver, :string
      add :apn, :string
      add :govsigned, :string
      add :concurrence, :string
      add :effective_date, :string
      add :effective_date_notes, :string
      add :api_link, :string
      add :pdf_download_link, :string
      add :html_download_link, :string

      add :chamber_id, references(:chambers, on_delete: :nothing)

      timestamps()
    end

  end
end
