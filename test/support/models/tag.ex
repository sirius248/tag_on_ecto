defmodule TestTagOnEcto.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias TestTagOnEcto.Tagging

  schema "tags" do
    field :name, :string
    has_many :taggings, Tagging, on_delete: :delete_all

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
