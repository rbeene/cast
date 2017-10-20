defmodule CastWeb.PageController do
  use CastWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
