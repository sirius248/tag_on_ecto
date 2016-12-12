defmodule TagOnEcto.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:taggings) do
      add :tag_id, references(:tags)
      add :taggable_id, :integer
      add :tagger_id, :integer
      timestamps
    end

    create index(:taggings, :taggable_id)
    create index(:taggings, :tagger_id)
  end
end
