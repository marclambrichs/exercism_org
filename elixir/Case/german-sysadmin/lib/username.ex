defmodule Username do
  @spec sanitize([binary]) :: [binary]
  def sanitize(username) do
    username
    # translate german chars
    |> Enum.map(&german_chars/1)
    |> List.flatten()
    # leave lowercase and underscores
    |> Enum.filter(fn c -> c == ?_ or (c >= ?a and c <= ?z) end)
  end

  @doc false
  @spec german_chars(binary) :: [binary]
  defp german_chars(c) do
    case c do
      # ä becomes ae
      ?ä -> [?a, ?e]
      # ö becomes oe
      ?ö -> [?o, ?e]
      # ü becomes ue
      ?ü -> [?u, ?e]
      # ß becomes ss
      ?ß -> [?s, ?s]
      # or else do nothing
      _ -> c
    end
  end
end
