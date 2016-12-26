defmodule TagOnEcto.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias TagOnEcto.Tagging

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
