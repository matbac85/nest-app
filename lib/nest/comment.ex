defmodule Nest.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nest.{Cabin, User}

  schema "comments" do
    belongs_to :user, User
    belongs_to :cabin, Cabin
    field :text, :string
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:text, :user_id, :cabin_id])
    |> validate_required([:text, :user_id, :cabin_id])
  end
end
