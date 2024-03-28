defmodule ButtKicker.WebhookInfo do
  @moduledoc false
  use TypedStruct
  use ExConstructor

  @supported_methods ~w[get post]a
  @error_unknow_method {:error, :unknow_method}

  typedstruct do
    field :method, :get | :post
    field :url, String.t()
    field :headers, %{String.t() => String.t()}, default: %{}
  end

  @spec new(ExConstructor.map_or_kwlist()) :: {:ok, t()} | {:error, :unknow_method}
  def new(map_or_kwlist) do
    map_or_kwlist
    |> super()
    |> maybe_method_to_atom()
  end

  defp maybe_method_to_atom(%{method: method} = webhook_info) when is_binary(method) do
    case String.to_existing_atom(method) do
      atom_method when atom_method in @supported_methods ->
        {:ok, %{webhook_info | method: atom_method}}

      _err ->
        @error_unknow_method
    end
  rescue
    _err -> @error_unknow_method
  end
end
