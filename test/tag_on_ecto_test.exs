defmodule TagOnEctoTest do
  use TagOnEcto.EctoCase
  alias TestTagOnEcto.{Tag, Tagging, User, Post}
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

  test "create tagging" do
    user = TestRepo.insert!(User.changeset(%User{}, %{name: "John Doe", email: "john.doe@example.com"}))
    tag = TestRepo.insert!(Tag.changeset(%Tag{}, %{name: "phoenix"}))
    post = TestRepo.insert!(Post.changeset(%Post{}, %{title: "Elixir and Phoenix"}))

    tagging = TestRepo.insert!(
      Tagging.changeset(%Tagging{}, %{
        tag_id: tag.id,
        tagger_id: user.id,
        tagger_type: "User",
        taggable_id: post.id,
        taggable_type: "Post"
      })
    )
  end
end
