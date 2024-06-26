defmodule Nest.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :firstname, :string
      add :lastname, :string
      add :password_hash, :string
    end

    create index(:users, :email, unique: true)
  end
end
