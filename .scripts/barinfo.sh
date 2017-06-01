#!/bin/bash

clock() {
	time=$(date +%R)
	echo -n %{F#808080}%{F#eee} $time
}

sound() {
	sound=$(amixer get Master 2>&1 | awk '/Front Left:/{gsub(/[\[\]]/, "", $5); print $5}')
	echo %{F#808080}%{F#eee} $sound
}

song() {
	current=$(mpc -p 7755 current)
	playing=$(mpc -p 7755 status | grep -o 'playing')

	if test "$playing" = "playing"; then
		echo %{F#808080}%{F#eee} $current
	else test "$playing" = "";
		echo ""
	fi
}

ping() {
   pong=$(ping eti.tf | cut -d = -f 4-)
   echo $pong
}

desktops() {
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
	tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

	for w in `seq 0 $((cur - 1))`; do cdesktop="${cdesktop} ◽"; done
	cdesktop="${cdesktop} %{F#eee}◾%{F#808080}"
	for w in `seq $((cur + 2)) $tot`; do cdesktop="${cdesktop} ◽"; done

	echo $cdesktop
}

network() {
	cnetwork=$(iwgetid -r)

	if test "$cnetwork" = ""; then
		echo ""
	else
		echo %{F#808080}%{F#eee} $cnetwork
	fi
}

battery() {
    percent=$(cat /sys/class/power_supply/BAT0/capacity)
    power_now=$(cat /sys/class/power_supply/BAT0/power_now)
		status=$(cat /sys/class/power_supply/BAT0/status)

    fullthing="${symbol}%{F#eee} ${percent}%"

    if test $status = "Charging"; then
        symbol=""
        echo -n "${symbol}%{F#eee} ${percent}%"
    elif test $percent = "99"; then
        symbol=""
        echo -n "${symbol}%{F#eee} 100%"
    else
        if test $percent -gt 60; then
            symbol=""
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
	echo "%{F#808080} %{l} $(desktops)  $(song) %{c} $(clock) %{r} $(network)  $(sound) %{F#808080} $(battery) "
	sleep 0.4
done
