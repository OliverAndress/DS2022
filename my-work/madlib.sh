#!/bin/bash

clear
echo "Let's build a mad-lib!"

read -p "1. Name an unusual sport: " NOUN1
read -p "2. Name an adjective to describe your favorite teacher: " ADJECTIVE1
read -p "3. Verb ending in -ing: " VERB1
read -p "4. Name your favorite fictional place: " NOUN2
read -p "5. Name an animal found in the jungle: " NOUN3
read -p "6. Write what emotion you are feeling right now: " ADJECTIVE2
read -p "7. Name a verb: " VERB2
read -p "8. Name your favorite food: " NOUN4
read -p "9. Name a fictional sport team name: " NOUN5
echo "In the year 2077, the $NOUN1 championship was very competitive. The Cavaliers and the $NOUN5 were down to the last play of the game."
echo "The $ADJECTIVE1 coach, known for $VERB1 in $NOUN2, had devised a clever strategy involving a $NOUN3."
echo "The players felt $ADJECTIVE2 but remained determined. They had to $VERB2 quickly."
echo "In the end, the Cavaliers won and they celebrated the win with their favorite food: $NOUN4!"

