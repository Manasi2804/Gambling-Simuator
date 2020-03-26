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
wincounter=0
lostcounter=0

function playGamblingForMonth(){

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
				((wincounter++))
				tempstake=$((tempstake+halfstake))
				stakewinorloseArray[$((counter++))]=$tempstake
				;;
			$losecondition)
				echo "You lost for the day $day"
				echo "Total lost amount:"$halfstake
				((lostcount))
				tempstake=$((tempstake-halfstake))
            stakewinorloseArray[$((counter++))]=$tempstake
            ;;

		esac
done
}
function printDailywinorlostRecords(){
echo "Your monthly record is :"
	# For loop to print 
	for value in ${!stakewinorloseArray[@]}
	do
		echo "day $value:${stakewinorioseArray[$value]}"
	done
	echo "No of days you lost:" $lostcounter
	echo "You lost by:" $((lostcounter*halfstake))
	echo "No of days you won:" $wincounter
	echo "You won by:" $((wincounter*halfstake))
}
function getLuckiestAndUnluckiestDay()
{
	maximumMoneyWon=${stakewinorloseArray[1]}
	maximumMoneyLost=${stakewinorloseArray[1]}
	for money in ${stakewinorloseArray[@]}
	do
		if [[ $money -lt $maximumMoneyLost ]]
		then
			maximumMoneyLost=$money
		elif [[ $money -gt $maximumMoneyWon ]]
		then
			maximumMoneyWon=$money
		fi
	done
	for countDay in ${!stakewinorloseArray[@]}
	do
		if [[ ${stakewinorloseArray[countDay]} -eq $maximumMoneyLost ]]
		then
			echo "Unluckiest day: "${countDay}
		elif [[ ${stakewinorloseArray[countDay]} -eq $maximumMoneyWon ]]
		then
			echo "Luckiest day: "${countDay}
		fi
	done
}

echo "Welcome to gambling simulation"
playGamblingForMonth
printDailywinorlostRecords
getLuckiestAndUnluckiestDay
