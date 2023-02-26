defmodule HanyWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HanyWeb.Telemetry,
      # Start the Endpoint (http/https)
      HanyWeb.Endpoint
      # Start a worker by calling: HanyWeb.Worker.start_link(arg)
      # {HanyWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HanyWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HanyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
