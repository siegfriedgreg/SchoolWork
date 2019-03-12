#!/bin/bash

#  Algorithms.
ALG=( 'bfs_' 'cc_' 'pr_' 'sssp_' )

#  Graphs: there are 15 (0-15) in total.
GRAPH=( 'gh001.txt' 'gh002.txt' 'gh004.txt' 'gh005.txt' 'gh006.txt' 'gh007.txt' 'gh008.txt' 'gh009.txt' 'gh010.txt' 'gh011.txt' 'gh012.txt' 'gh013.txt' 'gh014.txt' 'gh015.txt' 'gh016.txt' )

FOLDER=( 'Totem_Results' )

ET="terminate"
FT="elapsed:"
OutPut="totem_results.txt"
dot="../"

# Handles the switch between do_SSSP and the do_OTHERS
function get_File() {
  local Sum=0
  local PASS=3
  local Count=1
  local FILE="$1$2"

  if [ -e "$FILE" ]
  then
    while read -r f1 f2 f3 f4
    do
      if [ "$Count" == "$PASS" ]
      then
        Sum=$(python -c "print $Sum+$f1")
      fi
      Count=$(python -c "print $Count+1")
    done < $FILE

    printf '%s\t%s\t%.6f\n' "$3" "$FILE" "$Sum" >> "$dot$OutPut" 
  fi
}

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<       START       <<<<<<<<<<<<<<<<<<<<<<<<<<<<
echo "    Starting summary script"

  for i in "${ALG[@]}" # MAP
  do
    printf '\t%sstarting:\n' "$i" >> "$OutPut"
    for j in "${GRAPH[@]}" # BFS
    do
      for k in "${FOLDER[@]}" # LOCATION
      do
        cd $k
        ( get_File "$i" "$j" "$k") 
        cd ..        
      done
    done
  done
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<         FIN       <<<<<<<<<<<<<<<<<<<<<<<<<<<<
echo "    Finished summary script"

exit
