defmodule LunchTest do
  use ExUnit.Case
  doctest Lunch

  test "failed search" do
    assert Lunch.get_food_trucks(0) == "Nothing was found under search criteria"
  end

  test "successful search for the nearest spot" do
    nearest_food_truck_distance = 61 # circumverts randomness
    assert Lunch.get_food_trucks(nearest_food_truck_distance) == %FoodTruck{
      name: "The New York Frankfurter Co. of CA, Inc. DBA: Annie's Hot Dogs",
      type: "Push Cart",
      description: "Soft Pretzels: hot dogs: sausage: chips: popcorn: soda: espresso: cappucino: pastries: ice cream: italian sausages: shish-ka-bob: churros: juice: water: various drinks",
      location: "STOCKTON ST: OFARRELL ST to GEARY ST (100 - 199)",
      distance_feet: 60.072707188903344,
      lat: "37.786856111883054",
      lng: "-122.40689189299718"
    }

  end
end
