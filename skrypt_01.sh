#!/bin/bash
# Wypisanie argumentów dla Bash

licznik=1

while [[ $1 ]]
do
	echo "Argument $licznik to $1"
	licznik=$((licznik + 1))
	shift
done
licznik=$((licznik-1))
echo "Brak kolejnych argumentow, miales $licznik argumentow"
