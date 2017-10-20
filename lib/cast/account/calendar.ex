defmodule Cast.Account.Calendar do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cast.Account.Calendar


  schema "calendars" do
    field :organization_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Calendar{} = calendar, attrs) do
    calendar
    |> cast(attrs, [])
    |> validate_required([])
  end
end
