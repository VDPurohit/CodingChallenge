# CodingChallenge

##Task:-

* Load the list of cities from [here](cities.json).
* Be able to filter the results by a given prefix string, following these requirements:
     * Follow the prefix definition specified in the clarifications section below.
     * Implement a search algorithm optimised for fast runtime searches. Initial loading time of the app does not matter.
     * Search is case insensitive.
     * **Time efficiency for filter algorithm should be better than linear**
* Display these cities in a scrollable list, in alphabetical order (city first, country after). Hence, "Denver, US" should appear before "Sydney, Australia".
     * The UI should be as responsive as possible while typing in a filter.
     * The list should be updated with every character added/removed to/from the filter.
* Each city's cell should:
     * Show the city and country code as title.
     * Show the coordinates as subtitle.
     * When tapped, show the location of that city on a map.
* Provide unit tests showing that your search algorithm is displaying the correct results giving different inputs, including invalid inputs.

##Developmetn Tool:-
Xcode 12.4
Swift 5

#To run this code:-

1.Open Xcode
2. Select simulator and please hit the run button.


#screen which I created:-

1.Launch screen
2.List of City in alphanumeric order.
3.By taping on individual cell, shows the map with respect to Lattitude and Longitude.


#Feature and Design pattern which followed:-
1.MVVM,
2.CI/CD (Fastlane itegration with Github).
3.Dark and Light mode supported.
4.For Search, Use inbuilt functionality of Array.Filter with hasPrefix.
5.CLEAN code with coding standard.
6. Implmenting unitest cases.
7.Show the city and country code as title.
8.Show the coordinates as subtitle.
