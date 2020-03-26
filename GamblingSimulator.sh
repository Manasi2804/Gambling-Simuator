#!/bin/bash -x
#Constants
BET=1
#Variables
Stake=100
win=0
lose=0
randomcheck=0
counter=1
halfstake=$(($Stake/2))
wincondition=$((Stake+halfstake))
losecondition=$((Stake-halfstake))
echo "Welcome to gambling simulation"

while(( $Stake!=$wincondition && $Stake!=$losecondition ))
do
randomcheck=$((RANDOM%2))
case $randomcheck in
	1) echo "You lost"
			((lose++))
			Stake=$((Stake-BET))
			;;
	2) echo "You win"
			((win++))
			Stake=$((Stake+BET))
			;;
esac
done
echo" you resigned for the day"
echo" updated Stake:$Stake"

