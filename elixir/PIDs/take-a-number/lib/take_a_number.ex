defmodule TakeANumber do
  def start() do
    spawn(&loop/0)
  end

  def loop(counter \\ 0) do
    receive do
      {:report_state, sender_pid} -> send(sender_pid, counter) |> loop()
      {:take_a_number, sender_pid} -> send(sender_pid, counter + 1) |> loop()
      :stop -> nil
      _ -> loop()
    end
  end

end
