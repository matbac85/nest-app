defmodule NestWeb.CabinController do
  use NestWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Nest.Cabin
  alias Nest.Reservation
  alias Nest.Repo

  def index(conn, params) do
    cabins = list_cabins(params)
    json(conn, render_cabins(cabins))
  end

  def show(conn, %{"id" => id}) do
    cabin = Repo.get(Cabin, id) |> Repo.preload(comments: :user)
    json(conn, render_cabin(cabin))
  end

  def render_cabin(cabin) do
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
      end),
      comments: Enum.map(cabin.comments, fn(comment) ->
         %{
           id: comment.id,
           text: comment.text,
           user_firstname: comment.user.firstname,
           user_lastname: comment.user.lastname,
           created_at: comment.inserted_at
         }
      end)
    }
  end

  def render_cabins(cabins) do
    Enum.map(cabins, fn(cabin) ->
      render_cabin(cabin)
    end)
  end

  def list_cabins(params) do
    Cabin
    |> filter_area(Map.get(params, "area"))
    |> filter_max_guests(Map.get(params, "max_guests"))
    |> filter_date_range(Map.get(params, "start_date"), Map.get(params, "end_date"))
    |> Repo.all()
    |> Repo.preload(comments: :user)
  end

  @spec filter_area(any(), any()) :: any()
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

  def filter_date_range(query, nil, nil), do: query

  def filter_date_range(query, "", ""), do: query

  def filter_date_range(query, start_date, end_date) do
    from cabins in query,
    as: :cabins,
    where: not exists(
      from(reservations in Reservation,
      where: reservations.cabin_id == parent_as(:cabins).id,
      where: fragment(
        "( (daterange(?, ?) && daterange(?, ?))) ",
        reservations.start_date,
        reservations.end_date,
        ^(Date.from_iso8601!(start_date)),
        ^(Date.from_iso8601!(end_date))
      )
    ))
  end



  defp resize(n) do
    if n <= 9, do: "0#{n}", else: n
  end
end
