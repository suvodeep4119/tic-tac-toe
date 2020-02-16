#!/bin/bash 
echo "Welcome to the TIC-TAC-TOE Simulator"

#Array
board=(. . . . . . . . .)

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
		echo "Player assigned: O"
		echo "Computer assigned: X"
	else
		echo "Player assigned: X"
		echo "Computer assigned: O"
	fi
}

function doToss()
{
	local rand=$((RANDOM%2))
	if ((rand==1))
	then
		echo "Player won the toss, will play first."
	else
		echo "Computer won the toss, will play first."
	fi
}
function displayBoard()
{
	printBoard
}


#Main
printBoard
assign
doToss
displayBoard
