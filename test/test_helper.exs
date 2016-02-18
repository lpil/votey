ExUnit.start()

Mix.Task.run "ecto.create", ~w(-r Votey.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Votey.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(Votey.Repo, :manual)
