defmodule ButtKicker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ButtKickerWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:butt_kicker, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ButtKicker.PubSub},
      # Start a worker by calling: ButtKicker.Worker.start_link(arg)
      # {ButtKicker.Worker, arg},
      # Start to serve requests, typically the last entry
      ButtKickerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ButtKicker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ButtKickerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
