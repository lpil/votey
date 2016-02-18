defmodule Votey.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Database connections are also handled.
  """

  use ExUnit.CaseTemplate

  @router Votey.Router.init([])

  using do
    quote do
      use Plug.Test
      alias Votey.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]
      import Votey.ConnCase
    end
  end

  setup _tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Votey.Repo)
  end

  def get(path) do
    :get
    |> Plug.Test.conn(path)
    |> Votey.Router.call(@router)
  end
end
