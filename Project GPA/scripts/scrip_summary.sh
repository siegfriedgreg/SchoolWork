#!/usr/bin/env bash

#       works for bfs,cc,pr.
#       step 1: open the proper folder.
#       step 2: open first .txt file.
#       step 3: get every other line to 20; skip 'elapsed time'
#       step 4: add all values and divide by 10. send output to file.
#       step 5: repeat till end of algorithm type.

#       works for sssp.
#       N/A

#  Algorithms.
ALG=( 'bfs-' 'cc-' 'pr-' )

#  Graphs: #6 is sometimes not used. there are 10 (0-9) in total.
GRAPH=( 'ca2010.txt' 'cage15.txt' 'eu2005.txt' 'italyosm.txt' 'kron21.txt' 'roadca.txt' 'roadusa.txt' 'tx2010.txt' 'web1m.txt' 'webstan.txt' )

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                 GLOBAL VARIABLES
ETime="elapsed time:"
OutPut="summary_trials.txt"
dot="../"
touch $OutPut

# Gets passed a *.txt file and scans the lines for a value that is not the text
# -line, it sums the subsequent iterations and returns the avg of those values.
function get_Avg() {

  local FileLoc=$1
  local Sum=0
  local Count=0

  while read it
  do
    if [ "$it" != "$ETime" ]; then
        Conv=$(printf "%.7f" $it)
        Sum=`echo "scale=7; ${Sum} + ${Conv}" | bc -l`
        Count=$((Count + 1))
    fi
  done < $FileLoc

  echo "scale=7; ${Sum} / ${Count}" | bc -l

}

# Wrapper function that iterates through all the relevant files in the current 
# directory and sends the output to a file
function do_File() {

  for i in "${ALG[@]}"
  do

    for j in "${GRAPH[@]}"
    do

      File1="$i$j"

      if [ -e "$File1" ]
      then
        Total=$(get_Avg $File1)
        echo "$File1 = $Total" >> "$dot$OutPut"
      fi

    done

  done

}

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                  BENCHMARK
echo "Starting summary script"
echo "Benchmark trials:" >> "$OutPut"

cd benchmark\ trials/

do_File

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                  CILK
echo "CILK trials:" >> "$dot$OutPut"

cd ..
cd cilk\ trials/

do_File

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                  OPENMP
echo "OpenMP trials:" >> "$dot$OutPut"

cd ..
cd openmp\ trials/

do_File

echo "Finished summary script"
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<                  FIN
cd ..

exit
