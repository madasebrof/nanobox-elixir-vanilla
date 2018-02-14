defmodule Vanilla.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [supervisor(Vanilla, [])]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
