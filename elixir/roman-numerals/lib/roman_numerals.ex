defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @roman_numerals [
    [1000, "M"],
    [900, "CM"],
    [500, "D"],
    [400, "CD"],
    [100, "C"],
    [90, "XC"],
    [50, "L"],
    [40, "XL"],
    [10, "X"],
    [9, "IX"],
    [5, "V"],
    [4, "IV"],
    [1, "I"]
  ]

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    {_rest, string} =
      @roman_numerals
      |> List.foldl({number, ""}, &calculate/2)

    string
  end

  defp calculate([roman_value, symbol], {number, string}) do
    {rem(number, roman_value), string <> string_by_key(number, roman_value, symbol)}
  end

  defp string_by_key(number, key, symbol) do
    String.duplicate(symbol, div(number, key))
  end
end
