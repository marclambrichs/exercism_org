defmodule BasketballWebsite do
  @spec extract_from_path(map(), String.t()) :: String.t() | nil
  def extract_from_path(data, str) do
    Enum.reduce(String.split(str, "."), data, fn k, acc -> acc[k] end)
  end

  @spec get_in_path(map(), String.t()) :: String.t() | nil
  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
