#!/bin/bash -x
#Constants
BET=1
#Variables
Stake=100
win=0
lose=0
randomcheck=0
counter=1

echo "Welcome to gambling simulation"

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
echo" updated Stake:$Stake"

