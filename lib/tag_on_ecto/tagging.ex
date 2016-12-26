defmodule TagOnEcto.Tagging do
  use Ecto.Schema
  import Ecto.Changeset
  alias TagOnEcto.Tag

  schema "taggings" do
    belongs_to :tag, Tag
    field :taggable_id, :integer
    field :tagger_id, :integer

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:taggable_id, :tagger_id])
    |> cast_assoc(:tag)
  end
end
