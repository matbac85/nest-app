defmodule NestWeb.CabinController do
  use NestWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Nest.Cabin
  alias Nest.{Comment, Favorite, Reservation}
  alias Nest.Repo
  alias Nest.PlugAuth

  def index(conn, params) do
    user = PlugAuth.get_user(conn)
    cabins = list_cabins(params, user)
    json(conn, render_cabins(cabins))
  end

  def show(conn, %{"id" => id}) do
    user = PlugAuth.get_user(conn)

    cabin = get_cabin(id, user)
    json(conn, render_cabin(cabin))
  end


  def get_cabin(id, user) do
    Repo.get(cabin_query(user), id)
  end


  def render_cabin(%{favorite: favorite, cabin: cabin}) do
    %{
      id: cabin.id,
      name: cabin.name,
      price: cabin.price,
      max_guests: cabin.max_guests,
      area: cabin.area,
      city: cabin.city,
      description: cabin.description,
      favorite: favorite == 1,
      images:
        Enum.map(1..5, fn image_id ->
          "../cabins/#{resize(cabin.id)}/#{resize(cabin.id)}-#{image_id}.webp"
        end),
      comments:
        Enum.map(cabin.comments, fn comment ->
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
    Enum.map(cabins, fn cabin ->
      render_cabin(cabin)
    end)
  end

  def list_cabins(params, user) do
    cabin_query(user)
    |> filter_area(Map.get(params, "area"))
    |> filter_max_guests(Map.get(params, "max_guests"))
    |> filter_date_range(Map.get(params, "start_date"), Map.get(params, "end_date"))
    |> Repo.all()
  end

  def cabin_query(nil) do
    from cabin in Cabin,
    as: :cabin,
    preload: [comments: ^from(comments in Comment, order_by: [desc: comments.id])],
    select: %{favorite: false, cabin: cabin}
  end

  def cabin_query(user) do
    from cabin in Cabin,
    as: :cabin,
    preload: [comments: ^(from(comments in Comment, order_by: [desc: comments.id], preload: :user))],
    select: %{favorite: subquery(from(favorite in Favorite,
      where: favorite.cabin_id == parent_as(:cabin).id,
      where: favorite.user_id == ^user.id,
      select: count(favorite.id))),
    cabin: cabin},
    order_by: cabin.id
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
    from cabin in query,
      where:
        not exists(
          from(reservations in Reservation,
            where: reservations.cabin_id == parent_as(:cabin).id,
            where:
              fragment(
                "( (daterange(?, ?) && daterange(?, ?))) ",
                reservations.start_date,
                reservations.end_date,
                ^Date.from_iso8601!(start_date),
                ^Date.from_iso8601!(end_date)
              )
          )
        )
  end

  defp resize(n) do
    if n <= 9, do: "0#{n}", else: n
  end
end
