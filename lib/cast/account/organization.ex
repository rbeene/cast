defmodule Cast.Account.Organization do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cast.Account.{Organization, Calendar}


  schema "organizations" do
    field :name, :string
    has_one :calendar, Calendar

    timestamps()
  end

  @doc false
  def changeset(%Organization{} = organization, attrs) do
    organization
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def create_changeset(%Organization{} = organization, attrs) do
    changeset(organization, attrs)
    |> cast_assoc(:calendar)
  end
end
