defmodule Vanilla.Mixfile do
  use Mix.Project

  def project do
    [
      app: :blank,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [mod: {Vanilla.Application, []}]
  end


  defp deps do
    [{:timex, "~> 3.0"}]
  end
end
