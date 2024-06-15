defmodule NestWeb.FavoriteController do
  use NestWeb, :controller
  alias Nest.Repo
  alias Nest.Favorite

  def toggle(conn, params) do
    user = conn.assigns.user
    cabin_id = params["cabin_id"]

    if favorite = Repo.get_by(Nest.Favorite, %{user_id: user.id, cabin_id: cabin_id}) do
      Repo.delete(favorite)
      json(conn, false)
    else
      Favorite.changeset(%Favorite{}, %{user_id: user.id, cabin_id: cabin_id})
      |> Repo.insert()

      json(conn, true)
    end
  end
end
