defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime) do
    {:ok, noon} = Time.new(12, 0, 0)
    answer = Time.compare(NaiveDateTime.to_time(datetime), noon)
    if answer == :lt, do: true, else: false
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime),
      do: Date.add(checkout_datetime, 28),
      else: Date.add(checkout_datetime, 29)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(planned_return_date, NaiveDateTime.to_date(actual_return_datetime))
    if diff >= 0, do: 0, else: abs(diff)
  end

  def monday?(datetime) do
    if Date.day_of_week(NaiveDateTime.to_date(datetime)) == 1, do: true, else: false
  end

  def calculate_late_fee(checkout, return, rate) do
    ac = return_date(datetime_from_string(checkout))
    re = datetime_from_string(return)

    (days_late(ac, re) * rate)
    |> then(fn x -> if monday?(re), do: trunc(x / 2), else: x end)
  end
end
