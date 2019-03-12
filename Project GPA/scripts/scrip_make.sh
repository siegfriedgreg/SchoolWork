#!/usr/bin/env bash

######          OPENMP MAKE SCRIPT

ALG=( 'bfs-' 'cc-' 'pr-' 'sssp-' )
TST="test"

echo "Compiling all 4 algorithms "

echo "BFS"
pre="${ALG[0]}"
OutPut="$pre$TST"

python graphitc.py -f ../../test/input_with_schedules/bfs_benchmark.gt -o test.cpp
g++ -std=c++11 -I ../../src/runtime_lib/ -DOPENMP -fopenmp -O3 test.cpp -o $OutPut

echo "CC"
pre="${ALG[1]}"
OutPut="$pre$TST"

python graphitc.py -f ../../test/input_with_schedules/cc_benchmark.gt -o test.cpp
g++ -std=c++11 -I ../../src/runtime_lib/ -DOPENMP -fopenmp -O3 test.cpp -o $OutPut

echo "PR"
pre="${ALG[2]}"
OutPut="$pre$TST"

python graphitc.py -f ../../test/input_with_schedules/pagerank_benchmark.gt -o test.cpp
g++ -std=c++11 -I ../../src/runtime_lib/ -DOPENMP -fopenmp -O3 test.cpp -o $OutPut

echo "SSSP"
pre="${ALG[3]}"
OutPut="$pre$TST"

python graphitc.py -f ../../test/input_with_schedules/sssp_benchmark.gt -o test.cpp
g++ -std=c++11 -I ../../src/runtime_lib/ -DOPENMP -fopenmp -O3 test.cpp -o $OutPut

echo "Done with compilation, start ( scrip_run.sh ) next."

exit
