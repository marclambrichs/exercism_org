defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmp" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
      _ -> nil
    end
  end

  def type_from_binary(file_binary) do
    case file_binary do
      <<0x7F, 0x45, 0x4C, 0x46, _body::binary>> -> "application/octet-stream"
      <<0x42, 0x4D, _body::binary>> -> "image/bmp"
      <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _body::binary>> -> "image/png"
      <<0xFF, 0xD8, 0xFF, _body::binary>> -> "image/jpg"
      <<0x47, 0x49, 0x46, _body::binary>> -> "image/gif"
      _ -> nil
    end
  end

  def verify(file_binary, extension) do
    type_from_extension(extension)
    |> then(fn x ->
      cond do
        x == nil -> {:error, "Warning, file format and file extension do not match."}
        x == type_from_binary(file_binary) -> {:ok, x}
        true -> {:error, "Warning, file format and file extension do not match."}
      end
    end)
  end
end
