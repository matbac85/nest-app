defmodule NestWeb.UserController do
  use NestWeb, :controller
  alias Nest.Repo
  alias Nest.User
  alias Nest.Reservation
  import Ecto.Query, only: [from: 2]

  def create(conn, params) do
    case create_user(params) do
      {:ok, user} ->
        json(conn, render_user(user))

      {:error, changeset} ->
        conn
        |> put_status(422)
        |> json(render_errors(changeset))
    end
  end

  def me(conn, _params) do
    user =
      Repo.get(
        from(user in User,
          preload: [
            reservations:
              ^from(reservation in Reservation,
                order_by: [desc: reservation.start_date],
                preload: :cabin
              ),
            favorites: :cabin
          ]
        ),
        conn.assigns.user.id
      )

    json(conn, %{
      email: user.email,
      firstname: user.firstname,
      lastname: user.lastname,
      favorites:
        Enum.map(user.favorites, fn favorite ->
          %{
            id: favorite.id,
            cabin_name: favorite.cabin.name,
            cabin_price: favorite.cabin.price
          }
        end),
      reservations:
        Enum.map(user.reservations, fn reservation ->
          %{
            id: reservation.id,
            start_date: reservation.start_date,
            end_date: reservation.end_date,
            cabin_name: reservation.cabin.name
          }
        end)
    })
  end

  defp render_user(user) do
    %{
      firstname: user.firstname,
      lastname: user.lastname,
      email: user.email
    }
  end

  defp create_user(params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
