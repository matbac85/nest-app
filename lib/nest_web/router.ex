defmodule NestWeb.Router do
  use NestWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {NestWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_with_auth do
    plug Nest.PlugAuth
  end

  # Other scopes may use custom stacks.
  scope "/api", NestWeb do
    pipe_through :api
    get "/cabins", CabinController, :index
    get "/cabins/:id", CabinController, :show
    post "/users", UserController, :create
    post "/sessions", SessionController, :create
    pipe_through :api_with_auth
    get "/me", UserController, :me
    post "/cabins/:cabin_id/reservations", ReservationController, :create
    post "/cabins/:cabin_id/comments", CommentController, :create
    post "/cabins/:cabin_id/favorites/toggle", FavoriteController, :toggle
  end

  scope "/", NestWeb do
    pipe_through :browser

    get "/*path", PageController, :home
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:nest, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: NestWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
