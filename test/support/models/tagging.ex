defmodule TestTagOnEcto.Tagging do
  use Ecto.Schema
  import Ecto.Changeset
  alias TestTagOnEcto.Tag

  schema "taggings" do
    field :taggable_id, :integer
    field :taggable_type, :string
    field :tagger_id, :integer
    field :tagger_type, :string

    belongs_to :tag, Tag

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:tag_id, :taggable_id, :taggable_type, :tagger_id, :tagger_type])
  end
end
