defmodule Ohio.Repo.Migrations.CreateLegislator do
  use Ecto.Migration

  def change do
    create table(:legislators) do
      add :firstname, :string
      add :lastname, :string
      add :lpid, :string
      add :district, :string
      add :med_id, :integer
      add :position, :string
      add :displayname, :string
      add :sponsorname, :string
      add :aemembsponsor, :string
      add :revno, :integer
      add :apn, :string
      add :active, :boolean, default: false, null: false
      add :api_link, :string
      add :committees, :string
      add :partyid, :string
      add :chamber_id, references(:chambers, on_delete: :nothing)

      timestamps()
    end
    create index(:legislators, [:chamber_id])

  end
end
