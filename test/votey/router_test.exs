defmodule Votey.RouterTest do
  use Votey.ConnCase

  test "an unknown route returns 404" do
    conn = get("/something")
    assert conn.status == 404
  end
end
