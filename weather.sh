#! /bin/bash


echo "Let's have fun with weather";

# Read in the name of a city passed in as first argument
CITY=$1;

if [ CITY ]
then
    # curl to find current weather data and put it into JSON var
    JSON=$(curl "http://api.openweathermap.org/data/2.5/find?q=$CITY&mode=json" | jq '.list[0]["weather"][0]["description"]' );
fi

echo $JSON
echo "Done"
