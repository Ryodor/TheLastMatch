#!/bin/bash

source management_tab.sh
source ia.sh
source begin_end.sh
source player_turn.sh
source display.sh
declare -i turn
let "turn=1"
let "nb_turn=0"

main ()
{
    vard=$1
    bask=1
    begin $vard
    vard=$?
    create_stock $vard 
    calc_marge
    while [ $bask -eq 1 ]
    do
	display_tab
	if [ $turn -eq 1 ]
	then
	    player_turn 
	    let "turn = turn - 1"
	else
	    ia_base
	    let "turn = turn + 1"
	fi
	is_empty
	bask=$?
	let "nb_turn = nb_turn + 1"
    done
    end
}

if [ $# -ne 1 ]
then
    echo "USAGE : ./thelastmatch.sh [number_of_lines]"
else
    varr=$1
    main $varr
fi

