defmodule CastWeb.OrganizationController do
  use CastWeb, :controller

  alias Cast.Account
  alias Cast.Account.Organization

  action_fallback CastWeb.FallbackController

  def index(conn, _params) do
    organizations = Account.list_organizations()
    render(conn, "index.json", organizations: organizations)
  end

  def create(conn, %{"organization" => organization_params}) do
    with {:ok, %Organization{} = organization} <- Account.create_organization(organization_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", organization_path(conn, :show, organization))
      |> render("show.json", organization: organization)
    end
  end

  def show(conn, %{"id" => id}) do
    organization = Account.get_organization!(id)
    render(conn, "show.json", organization: organization)
  end

  def update(conn, %{"id" => id, "organization" => organization_params}) do
    organization = Account.get_organization!(id)

    with {:ok, %Organization{} = organization} <- Account.update_organization(organization, organization_params) do
      render(conn, "show.json", organization: organization)
    end
  end

  def delete(conn, %{"id" => id}) do
    organization = Account.get_organization!(id)
    with {:ok, %Organization{}} <- Account.delete_organization(organization) do
      send_resp(conn, :no_content, "")
    end
  end
end
