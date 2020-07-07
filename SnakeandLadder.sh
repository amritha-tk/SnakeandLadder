
#!/bin/bash

echo "Welcome to snake and ladder program"
START_POSITION=0

diceRoll=$((RANDOM%6+1))
echo "DiceRoll no:" $diceRoll

option=$((RANDOM%3))
if [ $option -eq '0' ]
    then
      STARTPOSITION=0
      echo "NO PLAY  hence Position="$START_POSITION
 elif [ $option -eq '1' ]
    then
       START_POSITION=$(($STARTPOSITION+$diceRoll))
       echo "LADDER and Position="$START_POSITION
 else
      START_POSITION=$(($STARTPOSITION-$diceRoll))
      echo "Snake and Position="$START_POSITION
fi

