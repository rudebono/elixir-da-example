defmodule Hany.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Hany.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hany.PubSub}
      # Start a worker by calling: Hany.Worker.start_link(arg)
      # {Hany.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Hany.Supervisor)
  end
end
