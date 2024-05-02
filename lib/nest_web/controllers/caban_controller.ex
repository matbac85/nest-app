defmodule NestWeb.CabanController do
  use NestWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    json(conn, [%{name: "Dans la forêt"}, %{name: "Cabane naturiste"}])
  end
end
