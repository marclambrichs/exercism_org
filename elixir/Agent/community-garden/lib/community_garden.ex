# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start() do
    Agent.start(fn -> %{max_id: 0} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state ->
      for {plot_id, registered_to} when is_integer(plot_id) <- state do
        %Plot{plot_id: plot_id, registered_to: registered_to}
      end
    end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      plot_id = Map.get(state, :max_id) + 1

      state =
        state
        |> Map.put(:max_id, plot_id)
        |> Map.put(plot_id, register_to)

      {%Plot{plot_id: plot_id, registered_to: register_to}, state}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn state ->
      Map.delete(state, plot_id)
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state ->
      case Map.get(state, plot_id) do
        nil -> {:not_found, "plot is unregistered"}
        registered_to -> %Plot{plot_id: plot_id, registered_to: registered_to}
      end
    end)
  end
end
