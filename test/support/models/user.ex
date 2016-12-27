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
