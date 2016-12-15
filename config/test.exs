use Mix.Config

config :logger, level: :error

config :tag_on_ecto, TestTagOnEcto.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tag_on_ecto_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
