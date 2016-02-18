defmodule Mix.Tasks.Server do
  @moduledoc """
  Start the web server.
  """
  @shortdoc "Start the web server"

  @doc """
  Starts the web server application.
  The port used is taken from the `port` environment variable.
  """
  def run(_) do
    port     = get_port()
    {:ok, _} = Plug.Adapters.Cowboy.http(Votey.Router, [], port: port)

    IO.puts """

    Always vote for principle, though you may vote alone, and you may cherish
    the sweetest reflection that your vote is never lost.

    Running on port #{port}
    """
    no_halt
  end

  defp iex_running? do
    Code.ensure_loaded?(IEx) && IEx.started?
  end

  defp no_halt do
    unless iex_running? do
      :timer.sleep :infinity
    end
  end

  defp get_port do
    case System.get_env("PORT") do
      nil ->
        4000
      str ->
        {port, _} = Integer.parse(str)
        port
    end
  end
end
