defmodule VendkitEng.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do

    import Supervisor.Spec, warn: false

    VendkitEng.Repo.start_link()

    Logger.configure([level: :debug])

    # Define workers and child supervisors to be supervised
    children = [
      supervisor(VendkitEng.Repo, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VendkitEng.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
