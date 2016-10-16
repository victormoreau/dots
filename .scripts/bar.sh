#!/bin/bash

clock() {
        DATETIME=$(date "+%R")
        echo -n  "$DATETIME "
}

battery() {
        BATPERC=$(acpi --battery | cut -d, -f2)
        echo "$BATPERC  "
}

spacer_center() {
  SPACER_CENTER=$(echo "             ~            ")
  echo "$SPACER_CENTER"
}

free_spacer() {
  FREE_SPACER=$(echo "                ")
  echo "$FREE_SPACER"
}

sound() {
  SOUND=$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq)
  echo "$SOUND"
}

desktops() {
    DESKTOP=$(bash /home/eti/.scripts/current_desktop.sh)
    echo "$DESKTOP"
}

# Print all
while true; do
        echo " %{+u} %{F#eee} %{l} %{F#eee} $(clock) %{c} $(desktops) %{r} $(battery)"
        sleep 0.1
done
