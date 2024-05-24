defmodule Nest.PlugAuth do
  import Plug.Conn
  @jwt_header "authorization"


  def init(default), do: default

  def call( conn, _default) do
    with {:ok, jwt} <- get_jwt(conn) |> IO.inspect,
         {:ok, claims} <-  Nest.Guardian.decode_and_verify(jwt) |> IO.inspect(),
         {:ok, user} <- Nest.Guardian.resource_from_claims(claims)
    do
      assign(conn, :user, user)
    else
      _ ->
        conn |> send_resp(403, "unauthorized") |> halt()
    end
  end

  defp get_jwt(conn) do
    case conn |> Plug.Conn.get_req_header(@jwt_header) |> List.first() do
      nil -> {:error, :jwt_not_found}
      jwt -> {:ok, String.replace_prefix(jwt, "Bearer ", "")}
    end
  end

  defp get_user(user_id) do
    Nest.Repo.get(Nest.User, user_id)
  end

end
