defmodule NestWeb.CommentController do
  use NestWeb, :controller
  alias Nest.Repo
  alias Nest.Comment

  def create(conn, params) do
    user = conn.assigns.user

    case create_comment(params, user) do
      {:ok, _user} ->
        json(conn, :ok)

      {:error, changeset} ->
        conn
        |> put_status(422)
        |> json(render_errors(changeset))
    end
  end

  defp create_comment(params, user) do
    %Comment{user_id: user.id}
    |> Comment.changeset(params)
    |> Repo.insert()
  end
end
