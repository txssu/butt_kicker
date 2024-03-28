defmodule ButtKicker.Workflows.Kick do
  @moduledoc false
  alias ButtKicker.Client
  alias ButtKicker.WebhookInfo
  alias ButtKicker.WorkflowsHelpers

  @spec call(map()) ::
          :ok
          | {:error, :payload_decode_error | :payload_not_found_error | :unknow_method | :request_error}
  def call(params) do
    with {:ok, payload} <- WorkflowsHelpers.fetch_payload(params),
         {:ok, webhook_info} <- WebhookInfo.new(payload),
         {:ok, _response} <- Client.kick(webhook_info) do
      :ok
    end
  end
end
