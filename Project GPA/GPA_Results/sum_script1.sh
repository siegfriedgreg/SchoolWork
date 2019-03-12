#!/bin/bash

#  Algorithms.
ALG=( 'bfs_' 'cc_' 'pr_' 'sssp_' )

#  Graphs: there are 15 (0-15) in total.
GRAPH=( 'gh001.txt' 'gh002.txt' 'gh004.txt' 'gh005.txt' 'gh006.txt' 'gh007.txt' 'gh008.txt' 'gh009.txt' 'gh010.txt' 'gh011.txt' 'gh012.txt' 'gh013.txt' 'gh014.txt' 'gh015.txt' 'gh016.txt' )

FOLDER=( 'Graphit_Results' )

ET="elapsed time:"
RD="rounds"
OutPut="graphit_results.txt"
dot="../"

# Handles the SSSP portion due to the different output of the others.
function do_SSSP() {
  if [ -e "$1" ]
    then
      local bit=0
      local Sum=0
      local Rct=0
      local Count=0

      while read it
      do
        if [ "$it" != "$ET" ] && [ "$it" != "$RD"  ]
        then
          if (( ((bit % 2)) == 0 ))
          then
            Sum=$(python -c "print $Sum+$it")
          else
            Rct=$(python -c "print $Rct+$it")
          fi
          bit=$((bit + 1))
        fi
        Count=$((Count + 1))
      done < $1

      Count=$((Count/4))
      Total=$(python -c "print $Sum/$Count")
      RCount=$(python -c "print $Rct/$Count")
      printf '%s\t%s\t%.6f---%d\n' "$2" "$1" "$Total" "$RCount" >> "$dot$OutPut"
    fi
}

# Handles the BFS,CC,PR portions due to similar outputs.
function do_OTHERS() {
  if [ -e "$1" ]
  then
    local Sum=0
    local Count=0

    while read it
    do
      if [ "$it" != "$ET" ]
      then
        Sum=$(python -c "print $Sum+$it")
        Count=$((Count + 1))
      fi
    done < $1

    Total=$(python -c "print $Sum/$Count")
    printf '%s\t%s\t%.6f\n' "$2" "$1" "$Total" >> "$dot$OutPut"
  fi
}

# Handles the switch between do_SSSP and the do_OTHERS
function get_File() {
  local Sum=0
  local Count=0
  local FILE="$1$2"

  if [ "$1" == "sssp_" ]
  then
      do_SSSP $FILE $3
  else
      do_OTHERS $FILE $3
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
