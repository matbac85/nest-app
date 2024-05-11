defmodule NestWeb.CabinController do
  use NestWeb, :controller

  def index(conn, _params) do
    cabins = Nest.Repo.all(Nest.Cabin)
    json(conn, render_cabins(cabins))
  end

  def render_cabins(cabins) do
    Enum.map(cabins, fn(cabin) ->
      %{
        id: cabin.id,
        name: cabin.name,
        description: cabin.description,
        images: Enum.map(1..5, fn(image_id) ->
          "../cabins/#{resize(cabin.id)}/#{resize(cabin.id)}-#{image_id}.webp"
        end)
      }
    end)
  end

  defp resize(n) do
    if n <= 9, do: "0#{n}", else: n
  end
end
