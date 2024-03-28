defmodule ButtKicker.URLBuilder do
  @moduledoc false
  alias ButtKicker.WorkflowsHelpers

  @payload_key WorkflowsHelpers.payload_key()

  @spec build(String.t(), ButtKicker.WebhookInfo.t()) :: String.t()
  def build(host, webhook_info) do
    host
    |> URI.new!()
    |> URI.append_path("/api/kick")
    |> URI.append_query(to_query(webhook_info))
    |> URI.to_string()
  end

  defp to_query(webhook_info) do
    payload = Jason.encode!(webhook_info)

    URI.encode_query(%{@payload_key => payload})
  end
end
