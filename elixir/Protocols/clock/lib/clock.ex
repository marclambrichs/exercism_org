defmodule Clock do
  defstruct hour: 0, minute: 0

  @doc """
  Returns a clock that can be represented as a string:

      iex> Clock.new(8, 9) |> to_string
      "08:09"
  """
  @spec new(integer, integer) :: Clock
  def new(hour, minute) when hour < 0 or hour > 23, do: new(Integer.mod(hour, 24), minute)

  def new(hour, minute) when minute < 0 or minute > 59,
    do: new(hour + Integer.floor_div(minute, 60), Integer.mod(minute, 60))

  def new(hour, minute), do: %Clock{hour: hour, minute: minute}

  @doc """
  Adds two clock times:

      iex> Clock.new(10, 0) |> Clock.add(3) |> to_string
      "10:03"
  """
  @spec add(Clock, integer) :: Clock
  def add(%Clock{hour: hour, minute: minute}, add_minute) do
    new(hour, minute + add_minute)
  end
end

defimpl String.Chars, for: Clock do
  def to_string(clock) do
    "#{clock.hour |> Integer.to_string() |> String.pad_leading(2, "0")}:#{clock.minute |> Integer.to_string() |> String.pad_leading(2, "0")}"
  end
end
