#!/bin/bash

slownik=$(cat slowa.txt)

while (( 1==1 )); do
	read -e -p "> " slowa

	for i in $slowa;do
		if [[ $i == "exit" ]];then
			echo "Adieu"
			exit
		elif (( 0 == $(cat slowa.txt | grep $i | wc -l) )); then
			echo "Nie ma takiego slowa w slowniku"
		else
			#liczby liter, samoglosek
			liczbaLiter=$(( $(echo $i | wc -m) - 1 ))
			liczbaSamoglosek=$(echo $i | grep -o [aeiouyąęAEIOUY] | wc -l)
			
			#slowo przed
			przed=$(cat slowa.txt | grep -B 1 -w $i | head -1)
			
			if [[ $i == $przed ]];then
				slowoPrzed="nie ma takiego slowa"
			else
				slowoPrzed=$przed
			fi

			#slowo po
			po=$(cat slowa.txt | grep -A 1 -w $i | tail -1)
			
			if [[ $i == $po ]];then
				slowoPo="nie ma takiego slowa"
			else
				slowoPo=$po
			fi

			#slowa bedace podciagiem tego slowa
			ileSlow=0
			for j in $(echo $slownik);do
				if (( $(echo $slownik | grep $j | grep -w $i | wc -l) >= 1 ));then
					ileSlow=$(( $ileSlow+1 ))
				fi
			done

			echo "Liczba liter $liczbaLiter"
			echo "Liczba liczba samoglosek $liczbaSamoglosek"
			echo "Liczba spolglosek $(( $liczbaLiter-$liczbaSamoglosek ))"
			echo "Liczba slow w slowniku, dla ktorych to slowo jest podciagiem $(echo $slownik | grep $i | wc -l)"
			echo "Liczba slow w slowniku, ktore sa podciagiem tego slowa $ileSlow"
			echo "Słowo ze słownika występujące bezpośrednio przed tym słowem $slowoPrzed"
			echo "Słowo ze słownika występujące bezpośrednio po tym słowie $slowoPo"
		fi	
	done
done