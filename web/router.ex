defmodule Telluride.Router do
  use Telluride.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Telluride do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Telluride do
    pipe_through :api

    get "/auth", ApiController, :auth
  end

  # Other scopes may use custom stacks.
  # scope "/api", Telluride do
  #   pipe_through :api
  # end
end
