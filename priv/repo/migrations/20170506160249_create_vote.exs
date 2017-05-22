defmodule Ohio.Repo.Migrations.CreateVote do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :type, :integer
      add :passed, :boolean, default: false, null: false
      add :aye, :integer
      add :nay, :integer
      add :source_id, :string
      add :revno, :string
      add :chamber_id, references(:chambers, on_delete: :nothing)

      timestamps()
    end

    create index(:votes, [:chamber_id])
  end
end
