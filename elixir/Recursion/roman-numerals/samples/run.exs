Benchee.run(
  %{
    "RomanNumerals" => fn -> RomanNumerals.numeral(3999) end
  },
  time: 10,
  memory_time: 2
)
