

#!/bin/bash

echo "Welcome to snake and ladder program"
CURRENT_POSITION=0
WIN_POSITION=10
diceRollCount=0
P1=1
P2=0
CURRENT_POSITION_P1=0
CURRENT_POSITION_P2=0
PLAY_AGAIN=0

while [ $CURRENT_POSITION -lt $WIN_POSITION ]
        do
        diceRoll=$((RANDOM%6+1))
        ((diceRollCount++))
        echo "DiceRoll no:" $diceRoll

           if [[ $P1 -eq '1' && $PLAY_AGAIN -eq '0' ]]
			then
			echo "Player1"
			 CURRENT_POSITION=$CURRENT_POSITION_P1
			 P1=0
			 P2=1
			 CURRENT_PLAYER="Player1"
		elif [[ $P2 -eq '1' && $PLAY_AGAIN -eq '0' ]]
			then
			echo "Player2"
			CURRENT_POSITION=$CURRENT_POSITION_P2
			P1=1
			P2=0
			CURRENT_PLAYER="Player2"
		elif [[ $P2 -eq '1' && $PLAY_AGAIN -eq '1' ]]
			then
			echo "Player 1 again"
			CURRENT_POSITION=$CURRENT_POSITION_P1
			P1=0
			P2=1
			PLAY_AGAIN=0
			CURRENT_PLAYER="Player1"
		else
			echo "Player 2 again"
			CURRENT_POSITION=$CURRENT_POSITION_P2
			P1=1
			P2=0
			PLAY_AGAIN=0
			CURRENT_PLAYER="Player2"
		fi

		#Conditions for Players
		option=$((RANDOM%3))
        if [ $option -eq '0' ]
                then
                   echo "NO PLAY : hence no movement , Position="$CURRENT_POSITION
        elif [ $option -eq '1' ]
                then
                        CURRENT_POSITION=$(( $CURRENT_POSITION + $diceRoll ))
                        if [ $CURRENT_POSITION -gt $WIN_POSITION ]
                                then
                                        CURRENT_POSITION=$(( $CURRENT_POSITION - $diceRoll ))
                                        echo "LADDER : Position greater than "$WIN_POSITION " hence limiting to position="$CURRENT_POSITION
                        else
                                         echo "LADDER : hence forward movement , Position="$CURRENT_POSITION
					 PLAY_AGAIN=1
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
	if [ $CURRENT_PLAYER == "Player1" ]
		then
			CURRENT_POSITION_P1=$CURRENT_POSITION
	else
			CURRENT_POSITION_P2=$CURRENT_POSITION
	fi
done
 echo "Total diceRoll count " $diceRollCount
echo $CURRENT_PLAYER "is the winner !!!"





