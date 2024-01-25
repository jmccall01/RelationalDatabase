#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#If argument given
if [[ $1 ]]
then
  #if argument is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    #search for element by atomic number
    CHECK_ELEMENT_EXISTS=$($PSQL "SELECT * FROM elements RIGHT JOIN properties USING(atomic_number) WHERE atomic_number=$1")
  else
    #search by name or symbol
    CHECK_ELEMENT_EXISTS=$($PSQL "SELECT * FROM elements RIGHT JOIN properties USING(atomic_number) WHERE name='$1' OR symbol='$1'")
  fi
  #If it exists print response
  if [[ $CHECK_ELEMENT_EXISTS ]]
  then
    echo $CHECK_ELEMENT_EXISTS | while IFS='|' read ATOMIC_NUM SYMBOL NAME MASS MP BP TYPE_ID
    do
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id='$TYPE_ID'")
      echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
    
  #If it doesn't print you couldn't fine it
  else
    echo "I could not find that element in the database."
  fi

#If no argument given
else
  echo "Please provide an element as an argument."
fi
