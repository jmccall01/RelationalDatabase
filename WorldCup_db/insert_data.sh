#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#Start with a two clean tables
$PSQL "TRUNCATE teams, games"

#Go through the games.csv file and loop through each line 
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #Add the winner of a game to teams if that team is not already in the table
  if [[ $WINNER != "winner" ]] 
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name="$WINNER"")
    if [[ -z $WINNER_ID ]]
    then
      INSERT_W=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_W = "INSERT 0 1" ]]
      then
        echo "Inserted into teams: $WINNER"
      fi
    fi
  fi

  if [[ $OPPONENT != "opponent" ]]
  then
    #Opponents
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name="$OPPONENT"")
    if [[ -z $OPP_ID ]]
    then
      INSERT_O=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_O = "INSERT 0 1" ]]
      then
        echo "Inserted into teams: $OPPONENT"
      fi
    fi
  fi

  if [[ $YEAR != "year" ]]
  then
    #Insert game data into games table
    #Get winner ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    #Get Opponent ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #Inset game into games table
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    #If successful, print the year, round, game and score
    if [[ $INSERT_GAME = "INSERT 0 1" ]]
    then
       echo "Inserted into games: $YEAR $ROUND: $WINNER $WINNER_GOALS - $OPPONENT_GOALS $OPPONENT"
    fi
  fi
done

