#!/bin/bash
#Salon Appointment Scheduler
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

#1: main menu
MAIN_MENU(){

  #If arg exists 
  if [[ $1 ]]
  then
    echo -e "\n$1"
  #Else first load
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi
  SERVICE_MENU
}

SERVICE_MENU(){
  #Get service_id and services
  GET_SERVICES=$($PSQL "SELECT * FROM services")
  #Print service list
  echo "$GET_SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  #Take input for service_id
  read SERVICE_ID_SELECTED
  #Check if number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  #not a number
  then
    MAIN_MENU "Please enter the number of the service you would like:"
  #is a number
  else
    #Find service
    SALON_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    #Check if service exists
    if [[ -z $SALON_SERVICE ]]
    #if not
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    #if it does, take phone number
    else
      echo -e "\nPlease enter your phone number:"
      read CUSTOMER_PHONE
    fi
  fi
  #check db for customer
  SALON_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  #if customer doesn't exist
  if [[ -z $SALON_CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  else
    CUSTOMER_NAME=$SALON_CUSTOMER_NAME
  fi

  #Get service name
  SERVICE_NAME=$(echo $($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'") | sed -E 's/ *$|^ *//g')

  #Ask for time
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  #get customer id
  SALON_CUSTOMER_ID=$(echo $($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'") | sed -E 's/ *$|^ *//g')
  #Add appointment
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($SALON_CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  #Final message
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

}
  

MAIN_MENU