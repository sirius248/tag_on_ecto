defmodule TagOnEcto do
  defmacro __using__(_opts) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro tag_on_ecto do
    quote do
      has_many :tags, TagOnEcto.Tag
    end
  end
end
