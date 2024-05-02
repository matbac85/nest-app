defmodule Nest.Repo do
  use Ecto.Repo,
    otp_app: :nest,
    adapter: Ecto.Adapters.Postgres
end
