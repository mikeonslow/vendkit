defmodule Vending.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    #    Vending.Repo.start_link()

    Logger.configure(level: :debug)

    # Define workers and child supervisors to be supervised
    children = [
      worker(Vending.Repo, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Vending.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
