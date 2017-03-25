#!/bin/bash

clock() {
	DATETIME=$(date +%R)
	echo -n %{F#DFC39B}%{F#eee} $DATETIME
}

sound() {
	SOUND=$(amixer get Master 2>&1 | awk '/Front Left:/{gsub(/[\[\]]/, "", $5); print $5}')
	echo %{F#DFC39B}%{F#eee} $SOUND
}

song() {
	CURRENTSONG=$(mpc -p 7755 current)
	PLAYING=$(mpc -p 7755 status | grep -o 'playing')

	if test "$PLAYING" = "playing"; then
		echo %{F#DFC39B}%{F#eee} $CURRENTSONG
	else test "$PLAYING" = "";
		echo ''
	fi
}

desktops() {
	CDESKTOP=$(bash ~/.scripts/current-desktop.sh)
	echo $CDESKTOP
}

network() {
	CNETWORK=$(iwgetid -r)
	echo %{F#DFC39B} %{F#eee} $CNETWORK
}

battery() {
    percent=$(cat /sys/class/power_supply/BAT0/capacity)
    power_now=$(cat /sys/class/power_supply/BAT0/power_now)

    fullthing="${symbol}%{F#eee} ${percent}%"

    if test $power_now = "0"; then
        symbol=""
        echo -n "${symbol}%{F#eee} ${percent}%"
    elif test $percent = "98"; then
        symbol=""
        echo -n "${symbol}%{F#eee} 100%"
    else
        if test $percent -gt 60; then
            symbol=""
            echo -n "${symbol}%{F#eee} ${percent}%"
        elif test $percent -gt 30; then
            symbol=""
            echo -n "${symbol}%{F#eee} ${percent}%"
        else
            symbol=""
            echo -n "${symbol}%{F#eee} ${percent}%"
        fi
    fi
}

# print all
while true; do
	echo "%{F#DFC39B} %{l} $(desktops)  $(song) %{c} $(clock) %{r} $(network)  $(sound) %{F#DFC39B} $(battery) "
	sleep 0.1
done
