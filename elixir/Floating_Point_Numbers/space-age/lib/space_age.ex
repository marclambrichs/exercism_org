defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @sec_in_year 365.25 * 24 * 3600
  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    case planet do
      :mercury -> {:ok, seconds / (0.2408467 * @sec_in_year)}
      :venus -> {:ok, seconds / (0.61519726 * @sec_in_year)}
      :earth -> {:ok, seconds / @sec_in_year}
      :mars -> {:ok, seconds / (1.8808158 * @sec_in_year)}
      :jupiter -> {:ok, seconds / (11.862615 * @sec_in_year)}
      :saturn -> {:ok, seconds / (29.447498 * @sec_in_year)}
      :uranus -> {:ok, seconds / (84.016846 * @sec_in_year)}
      :neptune -> {:ok, seconds / (164.79132 * @sec_in_year)}
      _ -> {:error, "not a planet"}
    end
  end
end
