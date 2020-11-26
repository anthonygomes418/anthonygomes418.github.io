#!/usr/bin/env bash
# File: guessinggame.sh
# Guessing Game Bash Script - The Unix Workbench

# initializing counter
File_counter=0;

# Funtion to go through the whole directory and calculate the number of files
function File_count {
	shopt -s nullglob
	File_counter=(*)
	File_counter=${#File_counter[@]}
    Directory_Counter=(*/)
    Directory_Counter=${#Directory_Counter[@]}
    (( File_counter -= Directory_Counter ))
}

# Functiom for the Guessing game to iterate till correct guess
function Counting_Game {
  echo "Welcome to the Guesing Game"
  echo "Enter your guess for the number of files in this directory"
  while [[ $int_num -ne File_counter  ]]; do
	read response
	int_num=${response%\.*};
	echo "Your guess to the nearest integer : $int_num"
	# Input Sanitation for only intergers since file numbers cannot be non-integers
	if ! [[ "$int_num" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]
	then
		echo "Please enter an integer to proceed "
	elif [[ $int_num -eq File_counter ]]
	then
		echo "Congratualtions, you guessed correctly"
	elif [[ $int_num -gt File_counter ]]
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