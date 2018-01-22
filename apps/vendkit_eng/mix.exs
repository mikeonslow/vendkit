defmodule VendkitEng.Mixfile do
  use Mix.Project

  def project do
    [
      app: :vendkit_eng,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [ mod: {VendkitEng.Application, []},
      applications: [:logger, :ecto, :mariaex],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.

  defp deps do
    [
      {:phoenix, "~> 1.3"},
      {:phoenix_html, "~> 2.3"},
      {:mariaex, ">= 0.0.0"},
      {:ecto, "~> 2.1.4"}
    ]
  end

end
