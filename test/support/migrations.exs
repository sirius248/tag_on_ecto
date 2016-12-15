defmodule TestTagOnEcto.Migrations do
  use Ecto.Migration

  def change do
    # Tag table
    create table(:tags) do
      add :name, :string
      timestamps
    end
    create unique_index(:tags, [:name])
    # End

    # Tagging table
    create table(:taggings) do
      add :tag_id, references(:tags)
      add :taggable_id, :integer
      add :tagger_id, :integer
      timestamps
    end
    create index(:taggings, :taggable_id)
    create index(:taggings, :tagger_id)
    # End 
  end
end
