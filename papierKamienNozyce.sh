if [[ $# == 0 ]];then
	echo "brak argumentow"
	exit
fi
cntPC=0
cntGracz=0
for i in $@;do
	#1-papier 2-kamien 3-nozyce
	randomowaCyfra=$(( (RANDOM%3)+1 ))
	if [[ $i == "p" ]];then
		gracz=1
	elif [[ $i == "k" ]];then
		gracz=2
	elif [[ $i == "n" ]];then
		gracz=3
	fi

	if [[ $randomowaCyfra == $gracz ]];then
		echo "remis"
	elif [[ $randomowaCyfra == 2 && $gracz == 1 ]];then
		echo "Gracz wygrywa"
		cntGracz=$(( $cntGracz+1 ))
	elif [[ $randomowaCyfra == 1 && $gracz == 2 ]];then
		echo "PC wygrywa"
		cntPC=$(( $cntPC+1 ))
	elif [[ $randomowaCyfra == 2 && $gracz == 3 ]];then
		echo "PC wygrywa"
		cntPC=$(( $cntPC+1 ))
	elif [[ $randomowaCyfra == 3 && $gracz == 2 ]];then
		echo "Gracz wygrywa"
		cntGracz=$(( $cntGracz+1 )) 
	elif [[ $randomowaCyfra == 1 && $gracz == 3 ]];then
		echo "Gracz wygrywa"
		cntGracz=$(( $cntGracz+1 ))
	elif [[ $randomowaCyfra == 3 && $gracz == 1 ]];then
		echo "PC wygrywa"
		cntPC=$(( $cntPC+1 ))
	fi
done
if [[ $cntPC > $cntGracz ]];then
	echo "Komputer wygral, wynik $cntPC : $cntGracz"
elif [[ $cntPC < $cntGracz ]];then
	echo "Gracz wygral, wynik $cntGracz : $cntPC"
else
	echo "remis $cntPC : $cntGracz"
fi