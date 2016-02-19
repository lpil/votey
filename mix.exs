defmodule Votey.Mixfile do
  use Mix.Project

  def project do
    [
      app: :votey,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      aliases: aliases,
      deps: deps
    ]
  end

  def application do
    [
      mod: {Votey, []},
      applications: ~w(logger cowboy plug postgrex ecto)a,
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp deps do
    [
      # Web server
      {:cowboy, "~> 1.0.0"},
      # Web application abstraction
      {:plug, "~> 1.0"},
      # Postgresql database adapter
      {:postgrex, ">= 0.0.0"},
      # Database query DSL
      #   Using master until 2.0 is released
      {:ecto, github: "elixir-lang/ecto"},

      # Style linter
      {:dogma, "~> 0.0", only: [:dev, :test]},
      # Test runner
      {:mix_test_watch, "~> 0.0", only: :dev},
    ]
  end

  defp aliases do
    [
      "ecto.setup": ~w(ecto.create ecto.migrate),
      "ecto.reset": ~w(ecto.drop ecto.setup),
    ]
  end
end
