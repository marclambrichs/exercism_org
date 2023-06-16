defmodule BasketballWebsite do
  @spec extract_from_path(map(), String.t()) :: String.t() | nil
  def extract_from_path(data, str), do: extract_from_list(data, String.split(str, "."))

  @doc false
  @spec extract_from_list(map(), list()) :: String.t() | nil
  defp extract_from_list(data, []), do: data

  defp extract_from_list(data, [h | t]) do
    if data[h], do: extract_from_list(data[h], t), else: nil
  end

  @spec get_in_path(map(), String.t()) :: String.t() | nil
  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
