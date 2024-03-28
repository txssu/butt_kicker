defmodule ButtKicker.WorkflowsHelpers do
  @moduledoc false
  @payload_key "butt_kicker_payload"

  @payload_decode_error {:error, :payload_decode_error}
  @payload_not_found_error {:error, :payload_not_found_error}

  def fetch_payload(%{@payload_key => payload}) do
    case Jason.decode(payload) do
      {:ok, _payload} = ok -> ok
      {:error, _reason} -> @payload_decode_error
    end
  end

  def fetch_payload(_map), do: @payload_not_found_error

  @spec payload_key() :: String.t()
  def payload_key, do: @payload_key
end
