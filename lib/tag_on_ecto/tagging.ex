defmodule TagOnEcto.Tagging do
  use Ecto.Schema
  alias TagOnEcto.Tag

  schema "taggings" do
    belongs_to :tag, Tag
    field :taggable_id, :integer
    field :tagger_id, :integer
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:taggable_id, :tagger_id])
    |> cast_assoc(:tag)
  end
end
