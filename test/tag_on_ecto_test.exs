defmodule TagOnEctoTest do
  use TagOnEcto.EctoCase
  alias TestTagOnEcto.{Tag}
  alias TagOnEcto.TestRepo

  doctest TagOnEcto

  test "create tag" do
    changeset = Tag.changeset(%Tag{}, %{name: "Elixir"})
    tag = TestRepo.insert! changeset
    assert tag.name == "Elixir"
  end

  test "cannot create tag with same name" do
    changeset = Tag.changeset(%Tag{}, %{name: "functional"})
    tag = TestRepo.insert! changeset
    assert tag.name == "functional"

    changeset = Tag.changeset(%Tag{}, %{name: "functional"})
    {:error, changeset} = TestRepo.insert changeset
    assert Keyword.has_key?(changeset.errors, :name) == true
    assert Keyword.get(changeset.errors, :name) == {"has already been taken", []}
  end
end
