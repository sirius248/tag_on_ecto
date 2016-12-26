use Mix.Config

config :tag_on_ecto, TagOnEcto.TestRepo,
  hostname: "localhost",
  database: "tag_on_ecto_test",
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, level: :warn
