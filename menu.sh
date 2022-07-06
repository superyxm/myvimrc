#!/bin/bash
# simple script menu
temp=$(mktemp -t test.XXXXXX)
temp2=$(mktemp -t test2.XXXXXX)


function diskspace {
    clear
    df -k > $temp
    dialog --textbox $temp 20 60
}

function whoseon {
    clear
    who > $temp
    dialog --textbox $temp 20 50
}

function memusage {
    clear
    cat /proc/meminfo > $temp
    dialog --textbox $temp 30 50
}

function menu {
    clear
    echo
    echo -e "\t\t\tSys Admin Menu\n"
    echo -e "\t1.Display disk space"
    echo -e "\t2.Display logged on users"
    echo -e "\t3.Display memory usage"
    echo -e "\t0.Exit program\n\n"
    echo -en "\t\tEnter option: "
    read -n 1 option
}

while [ 1 ]
do
dialog --menu "Sys Admin Menu" 20 30 10 1 "Display disk space" 2 "Display logged on users" 3 "Display memory usage" 0 "Exit program" 2> $temp2
if [ $? -eq 1 ]
then 
    break
fi

selection=$(cat $temp2)

case $selection in 
0)
    break ;;
1)
    diskspace ;;
2)
    whoseon ;;
3)
    memusage ;;
*)
    dialog --msgbox "Sorry, invalid selection" 10 30

esac
done
rm -f $temp 2> /dev/null
rm -f $temp2 2> /dev/null
clear
