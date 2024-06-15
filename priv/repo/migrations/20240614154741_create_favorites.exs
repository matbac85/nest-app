defmodule Nest.Repo.Migrations.CreateFavorites do
  use Ecto.Migration

  def change do
    create table(:favorites) do
      add :cabin_id, references(:cabins)
      add :user_id, references(:users)
      timestamps(type: :utc_datetime)
    end

    create index("favorites", [:cabin_id, :user_id], unique: true)
  end
end
