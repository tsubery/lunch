# Lunch

This project is a small tool to select a random food truck around the office. Currently the office coordinates are hardcoded at lib/lunch.ex:7 after searching for Este Lauder on Google Maps. The tool accepts an optional distance limit to avoid long travel time when time is limited.

## Installation
Install asdf version manager along with elixir plugin then type `asdf install` followed by `mix deps.get`

## Usage
Run the command `mix run -e Lunch.get_food_trucks` to pick a random food truck or `mix run -e "Lunch.get_food_trucks(2000)"` where 2000 is the the desired radius of the search in feet. Example output:
```
$> mix run -e "Lunch.get_food_trucks(1000)"
%FoodTruck{
  name: "San Francisco Street Foods, Inc.",
  type: "Push Cart",
  location: "POST ST: KEARNY ST to ROBERT KIRK LN (100 - 140)",
  description: "Hot dogs: condiments: soft pretzels: soft drinks: coffee: cold beverages: pastries: bakery goods: cookies: ice cream: candy: soups: churros: chestnuts: nuts: fresh fruit: fruit juices: desserts: potato chips and popcorn.",
  distance_feet: 963.1218159859351,
  lat: "37.78923328289614",
  lng: "-122.40557905421024"
}
```


## Tests
To run test use `mix test`. The test for successful search has the nearest truck hardcoded, that may change in the future.
