defmodule Nest.PlugAuth do
  import Plug.Conn
  @jwt_header "authorization"

  def init(default), do: default

  def call(conn, _default) do
    case get_user(conn) do
      nil -> conn |> send_resp(403, "unauthorized") |> halt()
      user -> assign(conn, :user, user)
    end
  end

  def get_user(conn) do
    with {:ok, jwt} <- get_jwt(conn),
         {:ok, claims} <- Nest.Guardian.decode_and_verify(jwt),
         {:ok, user} <- Nest.Guardian.resource_from_claims(claims) do
      user
    else
      _ ->
        nil
    end
  end

  defp get_jwt(conn) do
    case conn |> Plug.Conn.get_req_header(@jwt_header) |> List.first() do
      nil -> {:error, :jwt_not_found}
      jwt -> {:ok, String.replace_prefix(jwt, "Bearer ", "")}
    end
  end
end
