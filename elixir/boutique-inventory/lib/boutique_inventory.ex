defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn x -> x.price end, :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn x -> x.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn x -> %{x | :name => String.replace(x.name, old_word, new_word)} end)
  end

  def increase_quantity(item, count) do
    %{
      item
      | :quantity_by_size => Map.new(item[:quantity_by_size], fn {k, v} -> {k, v + count} end)
    }
  end

  def total_quantity(item) do
    item[:quantity_by_size] |> Enum.reduce(0, fn {_k, v}, acc -> v + acc end)
  end
end
