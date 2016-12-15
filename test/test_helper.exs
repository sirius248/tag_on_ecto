ExUnit.start()

Code.require_file "./support/schema.exs", __DIR__
Code.require_file "./support/repo.exs", __DIR__
Code.require_file "./support/migrations.exs", __DIR__

TestTagOnEcto.Repo.__adapter__.storage_down TestTagOnEcto.Repo.config
TestTagOnEcto.Repo.__adapter__.storage_up TestTagOnEcto.Repo.config

{:ok, _pid} = TestTagOnEcto.Repo.start_link
_ = Ecto.Migrator.up(TestTagOnEcto.Repo, 0, TestTagOnEcto.Migrations, log: false)
Ecto.Adapters.SQL.Sandbox.mode(TestTagOnEcto.Repo, :manual)
