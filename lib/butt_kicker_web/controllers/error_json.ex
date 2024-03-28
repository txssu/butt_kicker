defmodule ButtKickerWeb.ErrorJSON do
  require Logger

  def render("error.json", %{reason: reason}) do
    Logger.debug("Error #{reason}")

    %{error: reason}
  end
end
