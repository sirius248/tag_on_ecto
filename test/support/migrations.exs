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
      add :taggable_type, :string
      add :tagger_id, :integer
      add :tagger_type, :string
      
      timestamps
    end
    create index(:taggings, :taggable_id)
    create index(:taggings, :tagger_id)
    # End

    # User table
    create table(:users) do
      add :name, :string
      add :email, :string
      timestamps
    end
    # End

    # Post table
    create table(:posts) do
      add :title, :string
      timestamps
    end
    # End
  end
end
