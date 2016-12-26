defmodule TagOnEcto.EctoCase do
  use ExUnit.CaseTemplate

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TagOnEcto.TestRepo)
  end
end
