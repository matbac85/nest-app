defmodule Nest.Reservation do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nest.{Cabin, User}

  schema "reservations" do
    belongs_to :user, User
    belongs_to :cabin, Cabin
    field :start_date, :date
    field :end_date, :date
  end

  @doc false
  def changeset(reservation, attrs) do
    reservation
    |> cast(attrs, [:start_date, :end_date, :cabin_id, :user_id])
    |> validate_required([:start_date, :end_date, :cabin_id, :user_id])
    |> exclusion_constraint(:date,
      name: "unique_daterange_reservation",
      message: "La cabane est réservée à cette période"
    )
  end
end
