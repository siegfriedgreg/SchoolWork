#!/bin/bash
#SBATCH -N 1
#SBATCH -p GPU
#SBATCH --gres=gpu:k80:4
#SBATCH -t 06:00:00
#SBATCH --mail-type=ALL

set -x

export OMP_NUM_THREADS=28

echo "totem test"

####################    BFS    ####################

echo "Start BFS"

./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh001.totem &> bfs_gh001.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh002.totem &> bfs_gh002.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh004.totem &> bfs_gh004.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh005.totem &> bfs_gh005.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh006.totem &> bfs_gh006.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh007.totem &> bfs_gh007.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh008.totem &> bfs_gh008.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh009.totem &> bfs_gh009.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh010.totem &> bfs_gh010.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh011.totem &> bfs_gh011.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh012.totem &> bfs_gh012.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh013.totem &> bfs_gh013.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh014.totem &> bfs_gh014.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh015.totem &> bfs_gh015.txt
./benchmark -b6 -g1 -p2 -t16 ../../../../maps/gh016.totem &> bfs_gh016.txt

echo "Done with BFS"

####################    CC    ####################

echo "Start CC"

./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh001.totem &> cc_gh001.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh002.totem &> cc_gh002.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh004.totem &> cc_gh004.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh005.totem &> cc_gh005.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh006.totem &> cc_gh006.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh007.totem &> cc_gh007.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh008.totem &> cc_gh008.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh009.totem &> cc_gh009.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh010.totem &> cc_gh010.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh011.totem &> cc_gh011.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh012.totem &> cc_gh012.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh013.totem &> cc_gh013.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh014.totem &> cc_gh014.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh015.totem &> cc_gh015.txt
./benchmark -b8 -g1 -p2 -t16 ../../../../maps/gh016.totem &> cc_gh016.txt

echo "Done with CC"

####################    PR    ####################

echo "Start PR"

./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh001.totem &> pr_gh001.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh002.totem &> pr_gh002.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh004.totem &> pr_gh004.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh005.totem &> pr_gh005.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh006.totem &> pr_gh006.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh007.totem &> pr_gh007.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh008.totem &> pr_gh008.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh009.totem &> pr_gh009.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh010.totem &> pr_gh010.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh011.totem &> pr_gh011.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh012.totem &> pr_gh012.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh013.totem &> pr_gh013.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh014.totem &> pr_gh014.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh015.totem &> pr_gh015.txt
./benchmark -b1 -g1 -p2 -t16 ../../../../maps/gh016.totem &> pr_gh016.txt

echo "Done with PR"

####################    SSSP    ####################

echo "Start SSSP"

./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh001.totem &> sssp_gh001.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh002.totem &> sssp_gh002.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh004.totem &> sssp_gh004.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh005.totem &> sssp_gh005.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh006.totem &> sssp_gh006.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh007.totem &> sssp_gh007.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh008.totem &> sssp_gh008.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh009.totem &> sssp_gh009.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh010.totem &> sssp_gh010.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh011.totem &> sssp_gh011.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh012.totem &> sssp_gh012.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh013.totem &> sssp_gh013.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh014.totem &> sssp_gh014.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh015.totem &> sssp_gh015.txt
./benchmark -b2 -g1 -p2 -t16 ../../../../maps/gh016.totem &> sssp_gh016.txt

echo "Done with SSSP"

####################    FIN    ####################

wait

echo "finished totem!"

exit
