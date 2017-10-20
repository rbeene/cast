defmodule Cast.Repo.Migrations.CreateCalendars do
  use Ecto.Migration

  def change do
    create table(:calendars) do
      add :organization_id, references(:organizations, on_delete: :nothing)

      timestamps()
    end

    create index(:calendars, [:organization_id])
  end
end
