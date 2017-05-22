defmodule Ohio.Router do
  use Ohio.Web, :router

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

  scope "/", Ohio do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/bills", BillController
    resources "/resolutions", ResolutionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Ohio do
  #   pipe_through :api
  # end
end
