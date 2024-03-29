#!/usr/bin/env elixir

payload_key = "butt_kicker_payload"

case System.argv() do
  [host, webhook_info] ->
    query = URI.encode_query(%{payload_key => webhook_info})

    host
    |> URI.new!()
    |> URI.append_path("/api/kick")
    |> URI.append_query(query)
    |> URI.to_string()
    |> IO.puts()

  _other ->
    IO.puts("Usage: build_.exs <host> <webhook_info_json>")
end
