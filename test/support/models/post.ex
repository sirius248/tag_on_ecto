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
