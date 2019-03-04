defmodule BetaBabiesWeb.Router do
  use BetaBabiesWeb, :router

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

  scope "/", BetaBabiesWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/baby", BabyController, :index
    resources "/babies", BabyController
    resources "/guesses", GuessController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BetaBabiesWeb do
  #   pipe_through :api
  # end
end
