defmodule NestWeb.SessionController do
  use NestWeb, :controller
  alias Nest.User

  def create(conn, %{"email" => email, "password" => password}) do
    case User.check_password(email, password) do
      {:ok, user} ->
        json(conn, %{
          jwt: create_jwt(user),
          email: user.email,
          firstname: user.firstname,
          lastname: user.lastname
        })

      {:error, message} ->
        conn
        |> put_status(422)
        |> json(%{error: message})
    end
  end

  defp create_jwt(user) do
    {:ok, jwt, _} = Nest.Guardian.encode_and_sign(%{id: user.id})
    jwt
  end
end
