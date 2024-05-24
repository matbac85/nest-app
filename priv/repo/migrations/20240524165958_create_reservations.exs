defmodule Nest.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :cabin_id, references(:cabins)
      add :user_id, references(:users)
      add :start_date, :date
      add :end_date, :date
    end
  end
end
