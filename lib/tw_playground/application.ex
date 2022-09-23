defmodule TwPlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TwPlaygroundWeb.Telemetry,
      # Start the Ecto repository
      TwPlayground.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TwPlayground.PubSub},
      # Start the Endpoint (http/https)
      TwPlaygroundWeb.Endpoint
      # Start a worker by calling: TwPlayground.Worker.start_link(arg)
      # {TwPlayground.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TwPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TwPlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
