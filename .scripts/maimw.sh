#!/bin/bash

maim -i $(xdotool selectwindow) ~/Pictures/Screenshots/$(date +%F-%T).png --hidecursor
