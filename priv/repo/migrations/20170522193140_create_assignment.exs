defmodule Ohio.Repo.Migrations.CreateAssignment do
  use Ecto.Migration

  def change do
    create table(:assignments) do
      add :legislator_id, references(:legislators, on_delete: :nothing)
      add :committee_id, references(:committees, on_delete: :nothing)

      timestamps()
    end

    create index(:assignments, [:legislator_id])
    create index(:assignments, [:committee_id])
  end
end
