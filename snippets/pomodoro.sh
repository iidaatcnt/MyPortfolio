#!/bin/bash

clear
i=25
figlet ready?
read Wait
clear
figlet $((i))

while :
do
  sleep 1
  clear
  figlet $((i-=1))
  if [ $i -eq 0 ]
  then
    terminal-notifier -message "job finished"
    echo -n "Pomodoro[P],Short break[S], Long break[L]?> "
    read WAIT
    case "${WAIT:0:1}" in
      P | p )
        i=25
        ;;
      S | s)
        i=5
        ;;
      L | l)
        i=15
        ;;
      *)
        echo "Didn't match anything"
        echo "Pomodoro Start!"
        i=25
    esac
    clear
    figlet $((i))
  fi
done
