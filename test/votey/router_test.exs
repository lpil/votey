defmodule Votey.RouterTest do
  use ExUnit.Case
  use Plug.Test

  alias Votey.Router

  @router Router.init([])

  def get(path) do
    :get
    |> conn(path)
    |> Router.call(@router)
  end

  test "an unknown route returns 404" do
    conn = get("/something")
    assert conn.status == 404
  end
end
