defmodule Lunch do
  @moduledoc """
  CLI Utility to pick a random lunch spot
  """

  @data_url "https://data.sfgov.org/api/views/rqzj-sfat/rows.json"
  @home [37.7868818054959, -122.40709770254514]
  @unlimited -1

  def get_food_trucks(max_distance_feet \\ @unlimited) do
    with {:ok, %{status_code: code, body: body}}
         when code in 200..299 <- HTTPoison.get(@data_url) do
      JSON.decode!(body)
      |> Map.fetch!("data")
      |> Enum.map(&FoodTruck.from_row(@home, &1))
      |> Enum.sort_by(& &1.distance_feet)
      |> Enum.filter(fn truck ->
        max_distance_feet == @unlimited ||
          truck.distance_feet <= max_distance_feet
      end) |> case do
        [] ->
          "Nothing was found under search criteria"
        potential_trucks -> Enum.random(potential_trucks)
      end
      |> IO.inspect
    end
  end
end
