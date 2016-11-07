#!/bin/bash
clear

# define colors for colors
red="\e[31m"
grn="\e[32m"
ylw="\e[33m"
cyn="\e[36m"
blu="\e[34m"
prp="\e[35m"
wht="\e[37m"
bprp="\e[35;1m"
rst="\e[0m"

color-echo()
{  # print with colors
  echo -e " $red$1: $rst$2"
}

echo
echo -en "                          ${rst} ██████████ " && echo
echo -en "                          ${rst} ██████████ " && echo
echo -en "                          ${rst} ███${red}█${rst}██${red}█${rst}███ " && echo
echo -en "                          ${rst} ██████████ " && echo
echo -en "                          ${rst} ▀██▀██▀██▀ " && echo
echo
figlet YOU HAVE BEEN SPOOKED -f future.tlf | lolcat
echo
