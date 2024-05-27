defmodule Nest.Cabin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nest.Reservation

  schema "cabins" do
    field :name, :string
    field :description, :string
    field :area, :string
    field :city, :string
    field :max_guests, :integer
    field :price, :integer
    field :rating, :float
    has_many :reservations, Reservation
  end

  @doc false
  def changeset(cabin, attrs) do
    cabin
    |> cast(attrs, [:name, :area, :max_guests, :price, :description, :rating])
    |> validate_required([:name, :area, :max_guests, :price, :description, :rating])
  end
end
