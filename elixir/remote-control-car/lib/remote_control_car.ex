defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{} = remote_car) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(%RemoteControlCar{} = remote_car) do
    case remote_car.battery_percentage do
      0 -> "Battery empty"
      n -> "Battery at #{n}%"
    end
  end

  def drive(
        %RemoteControlCar{battery_percentage: perc, distance_driven_in_meters: dist} = remote_car
      ) do
    case perc do
      0 -> remote_car
      n -> %{remote_car | battery_percentage: n - 1, distance_driven_in_meters: dist + 20}
    end
  end
end
