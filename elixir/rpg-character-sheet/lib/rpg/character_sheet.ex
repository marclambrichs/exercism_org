defmodule RPG.CharacterSheet do
  @spec welcome() :: atom
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  @spec ask_name() :: String.t()
  def ask_name() do
    IO.gets("What is your character's name?\n")
    |> String.trim()
  end

  @spec ask_class() :: String.t()
  def ask_class() do
    IO.gets("What is your character's class?\n")
    |> String.trim()
  end

  @spec ask_level() :: integer
  def ask_level() do
    IO.gets("What is your character's level?\n")
    |> String.trim()
    |> String.to_integer()
  end

  @spec run() :: map
  def run() do
    :ok = welcome()

    %{}
    |> Map.put(:name, ask_name())
    |> Map.put(:class, ask_class())
    |> Map.put(:level, ask_level())
    |> IO.inspect(label: "\nYour character")
  end
end
