defmodule Votey do
  @moduledoc """
  A tiny voting app!
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    tree = [
      supervisor(Votey.Repo, []),
    ]
    opts = [name: Votey.Sup, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end
end
