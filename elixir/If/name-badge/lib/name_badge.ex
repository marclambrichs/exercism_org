defmodule NameBadge do

  @separator " - "

  @spec print(integer(), String.t(), String.t()) :: String.t()
  def print(id, name, department) do
     [id_label(id), name, dept_label(department)]
     |> Enum.reject(&is_nil/1)
     |> Enum.join(@separator)
  end

  @spec id_label(integer()) :: String.t()
  defp id_label(id) do
    if id, do: "[#{id}]"
  end

  @spec dept_label(String.t()) :: String.t()
  defp dept_label(dept) do
    if dept,do: "#{String.upcase(dept)}", else: "OWNER"
  end
end
