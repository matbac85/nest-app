defmodule NestWeb.UserController do
  use NestWeb, :controller
  alias Nest.Repo
  alias Nest.User

  def create(conn, params) do
    IO.inspect(params)
    case create_user(params) do
      {:ok, user} -> json(conn, render_user(user))
      {:error, changeset} -> 
        conn
        |> put_status(422)
        |> json(render_errors(changeset))
    end
  end

  def me(conn, _params) do
    user = conn.assigns.user
    json(conn, %{
      email: user.email,
      firstname: user.firstname,
      password: user.lastname
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
    |> Repo.insert
  end

  defp render_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
