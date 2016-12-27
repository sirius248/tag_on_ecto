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
    field :taggable_type, :string
    field :tagger_id, :integer
    field :tagger_type, :string

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:taggable_id, :taggable_type, :tagger_id, :tagger_type])
    |> cast_assoc(:tag)
  end
end

defmodule TestTagOnEcto.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias TestTagOnEcto.Tagging

  schema "posts" do
    field :title, :string
    has_many :taggings, Tagging

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:title])
  end
end

defmodule TestTagOnEcto.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestTagOnEcto.Tagging

  schema "users" do
    field :name, :string
    field :email, :string
    has_many :taggings, Tagging

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email])
  end
end
