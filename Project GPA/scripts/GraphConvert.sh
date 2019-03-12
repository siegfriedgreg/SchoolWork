#!/usr/bin/env bash

#  EDIT THE VARIABLES TO CHANGE FROM A WEIGHTED TO NON-WEIGHTED GRAPH.
#  BE SURE TO CHANGE MAP AND PAM TO THE FILE NAME AND TYPES FOUND IN THE PATHNAME SPECIFIED BY path IN EDIT VARIABLES.

MAP=( 'ca2010.mtx' 'cage15.mtx' 'eu2005.mtx' 'italyosm.mtx' 'kron21.graph' 'roadca.mtx' 'roadusa.mtx' 'tx2010.mtx' 'webbase1M.mtx' 'webstan.mtx' )
PAM=( 'ca2010' 'cage15' 'eu2005' 'italyosm' 'kron21' 'roadca' 'roadusa' 'tx2010' 'webbase1M' 'webstan' )
TYPE=( '.el' '.wel' )

#    EDIT VARIABLES!  
COUNT=10 # Number of maps in the list
typ="${TYPE[1]}" # Choose either unweighted(.el) or weighted (.wel)
path="./converter -f ../Graphs/" # Call converter for a specific directory
flg="-w -e" # Flag with the (-e) is always used, the (-w) used for (.wel)

function conv_Graph() {

  for (( i=0; i < $COUNT; i++ ))
  do
    local pre="${MAP[$i]}"
    local pam="${PAM[$i]}"
    local post="$pam$typ"
    local cmd="$path$pre $flg $post"
    $cmd
    echo "Completed: $pre --> $post "
  done  

}

echo "starting graph conversion!"

conv_Graph

echo "graphs are done converting"

echo "enjoy!"

exit
