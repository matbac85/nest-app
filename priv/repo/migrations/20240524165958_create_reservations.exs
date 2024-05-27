defmodule Nest.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :cabin_id, references(:cabins)
      add :user_id, references(:users)
      add :start_date, :date
      add :end_date, :date
    end

    execute "CREATE EXTENSION IF NOT EXISTS btree_gist"
    create constraint("reservations", :unique_daterange_reservation, exclude: ~s|gist (cabin_id WITH =, daterange(start_date, end_date, '[]') WITH &&)|)

  end
end
