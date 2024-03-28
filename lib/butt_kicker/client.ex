defmodule ButtKicker.Client do
  @moduledoc false

  require Logger

  @client __MODULE__

  @spec kick(ButtKicker.WebhookInfo.t()) :: {:ok, Finch.Response.t()} | {:error, :request_error}
  def kick(%{method: method, url: url, headers: headers} = webhook) do
    Logger.info("Kicking #{url}...")

    response =
      method
      |> Finch.build(url, Map.to_list(headers))
      |> Finch.request(@client)

    case response do
      {:ok, _response} = ok ->
        ok

      {:error, exception} ->
        Logger.error(fn ->
          "Response to #{inspect(webhook)} raise:\n#{inspect(exception)}"
        end)

        {:error, :request_error}
    end
  end
end
