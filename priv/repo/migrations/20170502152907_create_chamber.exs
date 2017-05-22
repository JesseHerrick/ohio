defmodule Ohio.Repo.Migrations.CreateChamber do
  use Ecto.Migration

  def change do
    create table(:chambers) do
      add :name, :string

      timestamps()
    end

  end
end
