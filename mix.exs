defmodule TagOnEcto.Mixfile do
  use Mix.Project

  @version "0.0.1"

  def project do
    [app: :tag_on_ecto,
     version: @version,
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :ecto, :timex_ecto]]
  end

  defp deps do
    [
      {:ecto, "~> 2.0.6"},
      {:timex_ecto, "~> 3.0.5"},
    ]
  end
end
