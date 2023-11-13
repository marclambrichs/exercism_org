defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_|tail]) do
    tail
  end

  def first([head|_]) do
    head
  end

  def count([]) do
    0
  end

  def count([_head|tail]) do
      1 + count(tail)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
