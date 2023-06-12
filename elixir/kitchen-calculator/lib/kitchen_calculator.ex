defmodule KitchenCalculator do

  @units %{:cup => 240, :fluid_ounce => 30, :teaspoon => 5, :tablespoon => 15, :milliliter => 1}

  def get_volume({_, digit}) do
    digit
  end

  def to_milliliter({unit, digit}), do: {:milliliter, digit * @units[unit]}

  def from_milliliter({:milliliter, digit}, unit), do: {unit, digit / @units[unit]}

  def convert(from, to) do
    from
    |> to_milliliter()
    |> from_milliliter(to)
  end
end
