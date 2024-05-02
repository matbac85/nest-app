defmodule Nest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NestWeb.Telemetry,
      Nest.Repo,
      {DNSCluster, query: Application.get_env(:nest, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Nest.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Nest.Finch},
      # Start a worker by calling: Nest.Worker.start_link(arg)
      # {Nest.Worker, arg},
      # Start to serve requests, typically the last entry
      NestWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Nest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
