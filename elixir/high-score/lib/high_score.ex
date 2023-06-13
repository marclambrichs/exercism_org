defmodule HighScore do
  @initial_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @initial_score), do: scores |> Map.put(name, score)

  def remove_player(scores, name), do: scores |> Map.delete(name)

  def reset_score(scores, name),
    do: scores |> Map.update(name, @initial_score, fn _ -> @initial_score end)

  def update_score(scores, name, score),
    do: scores |> Map.update(name, score, fn _ -> scores[name] + score end)

  def get_players(scores), do: scores |> Map.keys()
end
