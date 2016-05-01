defmodule Telluride.PageController do
  use Telluride.Web, :controller

  def index(conn, _params) do
    render conn, "login.html"
  end
end
