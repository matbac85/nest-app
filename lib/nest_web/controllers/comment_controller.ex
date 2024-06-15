defmodule NestWeb.CommentController do
  use NestWeb, :controller
  alias Nest.Repo
  alias Nest.Comment
  alias NestWeb.CabinController

  def create(conn, params) do
    user = conn.assigns.user

    case create_comment(params, user) do
      {:ok, comment} ->
        comment = Repo.preload(comment, :user)

        json(conn, %{
          id: comment.id,
          text: comment.text,
          user_firstname: comment.user.firstname,
          user_lastname: comment.user.lastname,
          created_at: comment.inserted_at
        })

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
