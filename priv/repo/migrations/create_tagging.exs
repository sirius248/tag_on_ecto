defmodule TagOnEcto.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:taggings) do

      timestamps
    end
  end
end
