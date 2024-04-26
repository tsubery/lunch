defmodule Lunch.MixProject do
  use Mix.Project

  def project do
    [
      app: :lunch,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 2.2.1"},
      {:geocalc, "~> 0.8"},
      {:json, "~> 1.4"}
    ]
  end
end
