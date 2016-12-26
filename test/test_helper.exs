Code.require_file "./support/schema.exs", __DIR__
Code.require_file "./support/test_repo.exs", __DIR__
Code.require_file "./support/migrations.exs", __DIR__

TagOnEcto.TestRepo.__adapter__.storage_down TagOnEcto.TestRepo.config
TagOnEcto.TestRepo.__adapter__.storage_up TagOnEcto.TestRepo.config

{:ok, _pid} = TagOnEcto.TestRepo.start_link
_ = Ecto.Migrator.up(TagOnEcto.TestRepo, 0, TestTagOnEcto.Migrations, log: false)

TagOnEcto.TestRepo.start_link
ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(TagOnEcto.TestRepo, :manual)
