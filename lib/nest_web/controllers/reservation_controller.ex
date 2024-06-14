defmodule NestWeb.ReservationController do
  use NestWeb, :controller
  alias Nest.Repo
  alias Nest.Reservation

  def create(conn, params) do
    user = conn.assigns.user

    case create_reservation(params, user) do
      {:ok, user} -> json(conn, render_reservation(user))
      {:error, changeset} ->
        conn
        |> put_status(422)
        |> json(render_errors(changeset))
    end
  end

  defp create_reservation(params, user) do
    %Reservation{user_id: user.id}
    |> Reservation.changeset(params)
    |> Repo.insert
  end

  defp render_reservation(reservation) do
    %{
      id: reservation.id,
      start_date: reservation.start_date,
      end_date: reservation.end_date,
      user_id: reservation.user_id,
      cabin_id: reservation.cabin_id
    }
  end

end
