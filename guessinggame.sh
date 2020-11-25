#!/usr/bin/env bash
# File: guessinggame.sh
# Guessing Game Bash Script - The Unix Workbench

# initializing counter
file_size=0;

# Funtion to go through the whole directory and calculate the number of files
function File_count {
	for name in * .*
	do
    if [[ ! -d $name ]]
    then
        file_size=$(($file_size+1))
    fi
	done
}

# Functiom for the Guessing game to iterate till correct guess
function Counting_Game {
  echo "Welcome to the Guesing Game"
  echo "Your task is to guess the number of files in your directory"
  echo "Enter your guess for the number of files in this directory"
  while [[ $response -ne file_size ]]
	do
	read response
	echo "You entered : $response"

	if [[ $response -eq file_size ]]
	then
		echo "Congratualtions, you guessed correctly"
	elif [[ $response -gt file_size ]]
	then
		echo "Your guess was too high, guess lower"
	else
		echo "Your guess was too low, guess higher"
	fi
done
}

# Calling Functions created
File_count
Counting_Game