use Mix.Config

config :votey, Votey.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "votey_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
