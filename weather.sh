#! /bin/bash


echo "Let's have fun with weather";

CITY=$1;

if [ CITY ]
then
    echo "I have found a city";
    echo $CITY;
    curl "http://api.openweathermap.org/data/2.5/find?q=$CITY&mode=json";
    echo "";
fi
