#!/bin/bash -x
#Constants
BET=1
#Variables
win=0
lose=0
randomcheck=0
counter=1
day=1
noofdays=20
tempstake=100
tempstake2=100

echo "Welcome to gambling simulation"

for((day=1;day<=20;day++))
do
	Stake=100
	halfstake=$(($Stake/2))
	wincondition=$((Stake+halfstake))
	losecondition=$((Stake-halfstake))
	while(( $Stake!=$wincondition && $Stake!=$losecondition ))
	do
		randomcheck=$((RANDOM%2))
		case $randomcheck in
			1)
				((lose++))
				Stake=$((Stake-BET))
				;;
			2)
				((win++))
				Stake=$((Stake+BET))
				;;
		esac
	done
	case $Stake in
		$wincondition)
			echo "You won for the day $day"
			echo "Total win amount: "$halfstake
			;;
		$losecondition)
			echo "You lost for the day $day"
			echo "Total lost amount:"$halfstake
			;;
	esac
done

