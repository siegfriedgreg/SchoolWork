#!/usr/bin/env bash

#<<<<<<<<<<<<<<<<               GLOBAL VARIABLES                <<<<<<<<<<<<<<<<
MAP=( 'ca2010-1' 'ca2010-2' 'cage15' 'eu2005' 'italyosm' 'kron21' 'roadca' 'roadusa' 'tx2010' 'webbase1m' 'webstan' )
ALG=( 'bfs-' 'cc-' 'pr-' 'sssp-' )
TYPE=( '.el' 'wel' )
K=${TYPE[0]}
TXT=".txt"
TST="test"

echo "running graph analysis on supplied graphs"

function do_Out() {

  local i=$1
  local test="$i$TST"

  for j in "${MAP[@]}"
  do  
    File1="$j$K"
    OutFile="$i$j$TXT"
    if [ -e "$File1" ]
    then
      echo "./$test ../../../Graphs/wel-graphs/$File1" 
    fi

  done
}
function start_Echo() {
  
  local s=$1
  echo "Starting conversion of $s"

}
function end_Echo() {
  local e=$1
  echo "Done with conversion of $e"
}

####################    BFS    ####################

pre="${ALG[0]}"

start_Echo $pre

do_Out $pre

end_Echo $pre

####################    CC    ####################

pre="${ALG[1]}"

start_Echo $pre

do_Out $pre

end_Echo $pre

####################    PR    ####################

pre="${ALG[2]}"

start_Echo $pre

do_Out $pre

end_Echo $pre

####################    SSSP    ####################

pre="${ALG[3]}"

start_Echo $pre

do_Out $pre

end_Echo $pre

####################    FIN    ####################

echo "finished with all of the tests!"

exit

