defmodule Ohio.Repo.Migrations.CreateCommittee do
  use Ecto.Migration

  def change do
    create table(:committees) do
      add :name, :string
      add :revno, :integer
      add :apn, :string
      add :active, :boolean, default: false, null: false
      add :api_link, :string
      add :chamber_id, references(:chambers, on_delete: :nothing)

      timestamps()
    end
    create index(:committees, [:chamber_id])

  end
end
