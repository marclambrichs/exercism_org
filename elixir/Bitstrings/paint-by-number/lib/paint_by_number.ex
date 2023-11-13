defmodule PaintByNumber do
  @spec palette_bit_size(pos_integer()) :: pos_integer()
  def palette_bit_size(color_count) do
    palette_bit_size(color_count, 1)
  end

  defp palette_bit_size(color_count, x) do
    if Integer.pow(2, x) >= color_count, do: x, else: palette_bit_size(color_count, x + 1)
  end

  @spec empty_picture() :: bitstring()
  def empty_picture() do
    <<>>
  end

  @spec test_picture() :: bitstring()
  def test_picture() do
    <<0b00::2, 0b01::2, 0b10::2, 0b11::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bitsize = palette_bit_size(color_count)
    <<pixel_color_index::size(bitsize), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count), do: nil

  def get_first_pixel(picture, color_count) do
    bitsize = palette_bit_size(color_count)
    <<value::size(bitsize), _::bitstring>> = picture
    value
  end

  def drop_first_pixel(<<>>, _color_count), do: <<>>

  def drop_first_pixel(picture, color_count) do
    bitsize = palette_bit_size(color_count)
    <<_::size(bitsize), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
