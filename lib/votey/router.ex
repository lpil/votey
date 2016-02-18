defmodule Votey.Router do
  @moduledoc """
  Turning HTTP requests into votes.
  """
  use Plug.Router

  if Mix.env in [:dev, :prod] do
    plug Plug.Logger
  end

  plug :match
  plug :dispatch

  match _ do
    conn
    |> send_resp(404, "Nothing to see here...")
  end
end
