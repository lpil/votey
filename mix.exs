defmodule Votey.Mixfile do
  use Mix.Project

  def project do
    [
      app: :votey,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  def application do
    [
      applications: ~w(logger cowboy plug)a
    ]
  end

  defp deps do
    [
      # Web server
      {:cowboy, "~> 1.0.0"},
      # Web application abstraction
      {:plug, "~> 1.0"},

      # Style linter
      {:dogma, "~> 0.0", only: :dev},
      # Test runner
      {:mix_test_watch, "~> 0.0", only: :dev},
    ]
  end
end
