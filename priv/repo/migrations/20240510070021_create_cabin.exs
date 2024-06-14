defmodule Nest.Repo.Migrations.CreateCabin do
  use Ecto.Migration

  def change do
    create table(:cabins) do
      add :name, :string
      add :area, :string
      add :city, :string
      add :max_guests, :integer
      add :price, :integer
      add :description, :text
      add :rating, :float
    end
  end
end
