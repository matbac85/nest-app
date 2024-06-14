defmodule Nest.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :cabin_id, references(:cabins)
      add :user_id, references(:users)
      add :text, :text
      timestamps(type: :utc_datetime)
    end
  end
end
