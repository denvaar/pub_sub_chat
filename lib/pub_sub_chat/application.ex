defmodule PubSubChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    # children = [
    #   # Starts a worker by calling: PubSubChat.Worker.start_link(arg)
    #   # {PubSubChat.Worker, arg}
    #   {Phoenix.PubSub.PG2, name: PubSubChat.PubSub}
    # ]
    children = [
      %{
        id: Phoenix.PubSub.PG2,
        start: {Phoenix.PubSub.PG2, :start_link, [:messages, []]}
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PubSubChat.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
