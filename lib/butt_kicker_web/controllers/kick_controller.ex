defmodule ButtKickerWeb.KickController do
  use ButtKickerWeb, :controller

  alias ButtKicker.Workflows.Kick
  alias ButtKickerWeb.FallbackController

  action_fallback FallbackController

  @spec kick(Plug.Conn.t(), map()) ::
          Plug.Conn.t()
          | {:error, :payload_decode_error | :payload_not_found_error | :unknow_method | :request_error}
  def kick(conn, params) do
    with :ok <- Kick.call(params) do
      render(conn, :ok)
    end
  end
end
