defmodule NestWeb.CabinController do
  use NestWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Nest.Cabin
  alias Nest.Repo

  def index(conn, params) do
    cabins = list_cabins(params)
    json(conn, render_cabins(cabins))
  end

  def render_cabins(cabins) do
    Enum.map(cabins, fn(cabin) ->
      %{
        id: cabin.id,
        name: cabin.name,
        price: cabin.price,
        max_guests: cabin.max_guests,
        area: cabin.area,
        city: cabin.city,
        description: cabin.description,
        images: Enum.map(1..5, fn(image_id) ->
          "../cabins/#{resize(cabin.id)}/#{resize(cabin.id)}-#{image_id}.webp"
        end)
      }
    end)
  end

  def list_cabins(params) do
    Cabin
    |> filter_area(Map.get(params, "area"))
    |> filter_max_guests(Map.get(params, "max_guests"))
    |> Repo.all()
  end

  def filter_area(query, ""), do: query

  def filter_area(query, nil), do: query

  def filter_area(query, area) do
    from cabins in query, where: cabins.area == ^area
  end


  def filter_max_guests(query, ""), do: query

  def filter_max_guests(query, nil), do: query

  def filter_max_guests(query, max_guests) do
    from cabins in query, where: cabins.max_guests >= ^max_guests
  end


  defp resize(n) do
    if n <= 9, do: "0#{n}", else: n
  end
end
