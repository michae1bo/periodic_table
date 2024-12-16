#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -q --no-align -c"
if [[ -z $1 ]]
then
	echo "Please provide an element as an argument."
fi
	ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
if [[ -z $ATOMIC_NUMBER ]]
then 
	ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
fi
if [[ -z $ATOMIC_NUMBER && $1 =~ ^[0-9]+$ ]]
then 
	ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
fi
if [[ -z $ATOMIC_NUMBER ]]
then 
	echo "I could not find that element in the database"
else 
	echo $ATOMIC_NUMBER
fi