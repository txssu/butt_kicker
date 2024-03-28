defmodule ButtKickerWeb.FallbackController do
  use ButtKickerWeb, :controller

  def call(conn, {:error, reason}) do
    conn
    |> put_status(:internal_server_error)
    |> put_view(json: ButtKickerWeb.ErrorJSON)
    |> render(:error, reason: reason)
  end
end
