

#!/bin/bash

echo "Welcome to snake and ladder program"
START_POSITION=0
WIN_POSITION=100

while [ $START_POSITION -lt $WIN_POSITION ]
	do
	diceRoll=$((RANDOM%6+1))
	echo "DiceRoll no:" $diceRoll

	option=$((RANDOM%3))
	if [ $option -eq '0' ]
		then
		   echo "NO PLAY : hence no movement , Position="$START_POSITION
	elif [ $option -eq '1' ]
		then
		   START_POSITION=$(( $START_POSITION + $diceRoll ))
			if [ $START_POSITION -gt $WIN_POSITION ]
				then
					START_POSITION=$WIN_POSITION
					echo "LADDER : Position greater than "$WIN_POSITION " hence limiting to position="$START_POSITION
			else
					echo "LADDER : hence forward movement , Position="$START_POSITION
			fi
	else
		START_POSITION=$(( $START_POSITION - $diceRoll ))
		if [ $START_POSITION -lt '0' ]
			then
				START_POSITION=0
				echo "SNAKE : Position less than 0 hence restarting to position="$START_POSITION

		else
				echo "SNAKE : hence reverse movement , Position="$START_POSITION
		fi
	fi
done









