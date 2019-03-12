#!/bin/bash

#  Algorithms.
ALG=( 'sssp_' )

#  Graphs: there are 15 (0-15) in total.
GRAPH=( 'gh006.txt' 'gh007.txt' 'gh008.txt' 'gh009.txt' 'gh010.txt' 'gh011.txt' 'gh012.txt' 'gh013.txt' 'gh014.txt' 'gh015.txt' 'gh016.txt' )

FOLDER=( 'Polymer_Results' )

ET="iteration"
FT="time:"
OutPut="polymer_results.txt"
dot="../"

# Handles the switch between do_SSSP and the do_OTHERS
function get_File() {
  local Sum=0
  local count=0
  local Temp=0
  local FILE="$1$2"

  if [ -e "$FILE" ]
  then
    while read -r f1 f2 f3 f4
    do
      if [ "$f1" == "$ET" ] && [ "$f2" == "$FT" ]
      then
        Temp=$(python -c "print $f3*1000")
        Sum=$(python -c "print $Sum+$Temp")
        Count=$((Count + 1))
      fi
    done < $FILE

    Sum=$(python -c "print $Sum/$Count")
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
