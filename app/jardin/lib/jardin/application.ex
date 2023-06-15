defmodule Jardin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      JardinWeb.Telemetry,
      # Start the Ecto repository
      Jardin.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Jardin.PubSub},
      # Start Finch
      {Finch, name: Jardin.Finch},
      # Start the Endpoint (http/https)
      JardinWeb.Endpoint
      # Start a worker by calling: Jardin.Worker.start_link(arg)
      # {Jardin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Jardin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    JardinWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
