defmodule FoodTruck do
  defstruct ~w[name type location description distance_feet lat lng]a

  @positions %{
    name: 9,
    type: 10,
    location: 12,
    description: 19,
    lat: 22,
    lng: 23
  }

  @meters_to_feet 3.2808398950131
  def from_row(home_coordinates, row) do
    truck = Enum.reduce(@positions,%__MODULE__{}, fn {attr, pos}, truck ->
      Map.put(truck, attr, Enum.at(row, pos))
    end)
    truck_coordinates = [parse_float(truck.lat), parse_float(truck.lng)]
    distance = Geocalc.distance_between(home_coordinates, truck_coordinates) * @meters_to_feet
    %{truck| distance_feet: distance}
  end

  def parse_float(str) when is_binary(str) do
    with {float, ""} <- Float.parse(str) do
      float
    end
  end

  def parse_float(str), do: str
end
