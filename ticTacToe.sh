#!/bin/bash 
echo "Welcome to the TIC-TAC-TOE Simulator"

#Array
board=(. . . . . . . . .)

#Variables
playerMoveSign=0
computerMoveSign=0
gameStatus=1
playerTurn=0
computerTurn=0

#Functions
function printBoard()
{
	echo "r/c 0 1 2"
	echo "0 ${board[0]} ${board[1]} ${board[2]}"
	echo "1 ${board[3]} ${board[4]} ${board[5]}"
	echo "2 ${board[6]} ${board[7]} ${board[8]}"
}

function assign()
{
	local rand=$((RANDOM%2))
	if ((rand==1))
	then
		playerMoveSign=O
		computerMoveSign=X
		echo "Player assigned: O"
		echo "Computer assigned: X"
	else
		playerMoveSign=X
		computerMoveSign=O
		echo "Player assigned: X"
		echo "Computer assigned: O"
	fi
}

function doToss()
{
	local rand=$((RANDOM%2))
	if ((rand==1))
	then
		playerTurn=1
		echo "Player won the toss, will play first."
	else
		computerTurn=1
		echo "Computer won the toss, will play first."
	fi
}
function displayBoard()
{
	printBoard
}
#Placing X or O in any location
function set()
{
	location=$(( $1 * 3 + $2 ))
	if [ ${board[$location]} == "." ]
	then
		board[$location]=$3
		player=$((player%2+1))
	else
		echo "You can't place there !!"
	fi
}

#Common function to check win,lose or move on
function checkMatch()
{
	if [ ${board[$1]} != "." ] && [ ${board[$1]} == ${board[$2]} ] && [ $board[$2]} == ${board[$3]} ]
	then
		gameStatus=0
	fi
}

#Winning rules
function checkGame()
{
	checkMatch 0 1 2
	checkMatch 3 4 5
	checkMatch 6 7 8
	checkMatch 0 3 6
	checkMatch 1 4 7
	checkMatch 2 5 8
	checkMatch 0 4 8
	checkMatch 2 4 6
}
#Main
printBoard
assign
doToss


while (( 1==1 ))
do
	echo " "
	if (( playerTurn == 1 ))
	then
		symbol=$playerMoveSign
		echo "Player Turn: ($symbol)"
	else
		symbol=$playerMoveSign
		echo "Player turn: ($symbol)"
	fi
	printBoard
	echo " "
	echo "Command:"
	echo "1. set [row] [column]"
	echo "2. exit"
	
	while (( 1 == 1 ))
	do
		read -r cmd a b
	if (( $cmd == "set" ))
	then
		set $a $b $symbol
		break
	elif (( $cmd == "exit" ))
	then
		break
	else
		echo "Wrong command, try again"
	fi
done
checkGame
if (( $gameStatus != 1 ))
then
	echo "Gameover ! "
	player=$((player%2+1))
	echo "Player $player ($symbol) win !!"
	while (( 1 == 1 ))
	do
		read -r cmd n
		if (( $cmd == "exit" ))
		then
			break
		fi
	done
fi
done
