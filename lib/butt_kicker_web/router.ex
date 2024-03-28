defmodule ButtKickerWeb.Router do
  use ButtKickerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ButtKickerWeb do
    pipe_through :api
  end
end
