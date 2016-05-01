defmodule Telluride.ApiController do
  use Telluride.Web, :controller

  def auth(conn, _params) do
    json conn, %{message: "the user is authorized"}
  end
end
