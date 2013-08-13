#! /bin/bash


echo "Let's have fun with weather";

# Read in the name of a city passed in as first argument
CITY=$1;

if [ CITY ]
then
    # curl to find current weather data and put it into JSON var
    JSON=$(curl "http://api.openweathermap.org/data/2.5/find?q=$CITY&mode=json");
fi

# Set string delimiter to comma and split the result
IFS=": ," read -ra ADDR <<< "$JSON"
IS_WEATHER="no"


# for each string in the array
for i in "${ADDR[@]}"; do
    # if IS_WEATHER has been set: output it
    if [ "$IS_WEATHER" = "yes" ];
        then
            echo $i
    fi

    # check to see if we have found weather yet
    if [ "$i" = '"weather"' ];
        then
            IS_WEATHER="yes"
    fi
done
