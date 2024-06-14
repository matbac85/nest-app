defmodule Nest.Favorite do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nest.{Cabin, User}

  schema "favorites" do
    belongs_to :user, User
    belongs_to :cabin, Cabin
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(favorite, attrs) do
    favorite
    |> cast(attrs, [:cabin_id, :user_id])
    |> validate_required([:cabin_id, :user_id])
  end
end
