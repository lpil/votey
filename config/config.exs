use Mix.Config

config :votey, Votey.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "votey_dev",
  hostname: "localhost",
  pool_size: 10

case Mix.env do
 :test -> import_config("test.exs")
 _     -> nil
end
