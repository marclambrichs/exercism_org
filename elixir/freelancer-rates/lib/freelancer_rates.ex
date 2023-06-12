defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    total = discount * (before_discount / 100) 
    before_discount - total
  end

  def monthly_rate(hourly_rate, discount) do
    total = apply_discount(22 * daily_rate(hourly_rate), discount)
    total |> Float.ceil |> trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount),1)
  end
end
