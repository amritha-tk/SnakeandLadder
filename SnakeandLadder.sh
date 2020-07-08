

#!/bin/bash

echo "Welcome to snake and ladder program"
CURRENT_POSITION=0
WIN_POSITION=10

while [ $CURRENT_POSITION -lt $WIN_POSITION ]
	do
	diceRoll=$((RANDOM%6+1))
	echo "DiceRoll no:" $diceRoll

	option=$((RANDOM%3))
	if [ $option -eq '0' ]
		then
		   echo "NO PLAY : hence no movement , Position="$CURRENT_POSITION
	elif [ $option -eq '1' ]
		then
		   CURRENT_POSITION=$(( $CURRENT_POSITION + $diceRoll ))
			if [ $CURRENT_POSITION -gt $WIN_POSITION ]
				then
					CURRENT_POSITION=$WIN_POSITION
					echo "LADDER : Position greater than "$WIN_POSITION " hence limiting to position="$CURRENT_POSITION
			else
					 echo "LADDER : hence forward movement , Position="$CURRENT_POSITION
			fi
	else
		CURRENT_POSITION=$(( $CURRENT_POSITION - $diceRoll ))
		if [ $CURRENT_POSITION -lt '0' ]
			then
				CURRENT_POSITION=0
				echo "SNAKE : Position less than 0 hence restarting to position="$CURRENT_POSITION

		else
				echo "SNAKE : hence reverse movement , Position="$CURRENT_POSITION
		fi
	fi
done









