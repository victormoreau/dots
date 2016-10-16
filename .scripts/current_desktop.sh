cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`
for w in `seq 0 $((cur - 1))`; do line="${line}ô"; done
line="${line}õ"
for w in `seq $((cur + 2)) $tot`; do line="${line}ô"; done
echo $line
