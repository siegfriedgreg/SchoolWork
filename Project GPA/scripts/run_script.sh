#!/bin/bash

#<<<<<<<<<<<<<<<<               GLOBAL VARIABLES                <<<<<<<<<<<<<<<<
MAP=( 'ca2010' 'cage15' 'eu2005' 'ITosm' 'kron21' 'roadca' 'roadusa' 'tx2010' 'webb1M' 'webstan' )
ALG=( 'bfs-' 'cc-' 'pr-' 'sssp-' )
TYPE=( '.el' '.wel' )
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
      ./$test ../../../Graphs/el-graphs/$File1 &> $OutFile
    fi
  done
}
function start_Echo() {  
  local s=$1
  echo "Starting $s tests"
}
function end_Echo() {
  local e=$1
  echo "Finished $e tests"
}

####################    START    ####################

for i in "${ALG[@]}"
do
  start_Echo $i
  do_Out $i
  end_Echo $i
done

####################    FIN    ####################

wait

echo "finished with all of the tests!"

exit




