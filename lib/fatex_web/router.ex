defmodule FatexWeb.Router do
  use FatexWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FatexWeb do
    pipe_through :browser

    live "/", HomeLive
    live "/model/:model_id", ModelLive do
      live "/step", StepLive, session: [:step_id]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", FatexWeb do
  #   pipe_through :api
  # end
end