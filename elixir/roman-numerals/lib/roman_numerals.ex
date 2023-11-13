defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @roman_numerals %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    {_rest, string} =
      @roman_numerals
      |> Map.keys()
      |> Enum.sort()
      |> Enum.reverse()
      |> List.foldl({number, ""}, &calculate/2)

    string
  end

  defp calculate(roman_value, {number, string}) do
    {rem(number, roman_value), string <> string_by_key(number, roman_value)}
  end

  defp string_by_key(number, key) do
    String.duplicate(@roman_numerals[key], div(number, key))
  end
end
