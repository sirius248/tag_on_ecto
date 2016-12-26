defmodule TestTagOnEcto.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias TestTagOnEcto.Tagging

  schema "tags" do
    field :name, :string
    has_many :taggings, Tagging

    timestamps
  end


  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end

defmodule TestTagOnEcto.Tagging do
  use Ecto.Schema
  import Ecto.Changeset
  alias TestTagOnEcto.Tag

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
