defmodule TagOnEctoTest do
  use TagOnEcto.EctoCase
  alias TestTagOnEcto.{Tag}
  alias TagOnEcto.TestRepo

  doctest TagOnEcto

  test "create tag" do
    changeset = Tag.changeset(%Tag{}, %{name: "Elixir"})
    user = TestRepo.insert! changeset
    assert user.name == "Elixir"
  end
end
