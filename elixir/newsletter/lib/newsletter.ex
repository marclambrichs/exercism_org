defmodule Newsletter do
  def read_emails(path) do
    {:ok, pid} = File.open(path, [:read])

    case IO.read(pid, :eof) do
      {:error, _reason} -> nil
      :eof -> []
      data -> String.split(data, "\n", trim: true)
    end
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log = open_log(log_path)

    read_emails(emails_path)
    |> Enum.map(fn x -> :ok == send_fun.(x) && log_sent_email(log, x) end)

    close_log(log)
  end
end
