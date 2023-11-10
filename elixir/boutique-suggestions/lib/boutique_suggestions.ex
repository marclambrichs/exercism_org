defmodule BoutiqueSuggestions do

  @default_max_price 100.00

  def get_combinations(tops, bottoms, options \\ [] ) do
    maximum_price = Keyword.get(options, :maximum_price, @default_max_price)
    for top <- tops,
        bottom <- bottoms,
        bottom.base_color != top.base_color,
        top.price + bottom.price <= maximum_price do
      {top, bottom}
    end
  end
end
