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

    get "/file/:model_id/:render_id", FileController, :get

    live "/", HomeLive
    live "/model/:model_id", ModelLive 
    live "/step", StepLive, session: [:step_id] 
    live "/section", SectionLive, session: [:root_section_id]
    live "/menu", MenuLive, session: [:step_id]
  end

  # Other scopes may use custom stacks.
  # scope "/api", FatexWeb do
  #   pipe_through :api
  # end
end
