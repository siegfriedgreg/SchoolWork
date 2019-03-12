#!/bin/bash
#SBATCH -N 1
#SBATCH -p RM
#SBATCH --ntasks-per-node 28
#SBATCH -t 06:00:00
#SBATCH --mail-type=ALL

set -x

export OMP_NUM_THREADS=28

echo "polymer test"

####################    BFS    ####################

echo "Start BFS"

./numa-BFS ../maps/gh001.adj 88 &> bfs_gh001.txt
./numa-BFS ../maps/gh002.adj 522 &> bfs_gh002.txt
./numa-BFS ../maps/gh004.adj 244 &> bfs_gh004.txt
./numa-BFS ../maps/gh005.adj 418 &> bfs_gh005.txt
./numa-BFS ../maps/gh006.adj 507 &> bfs_gh006.txt
./numa-BFS ../maps/gh007.adj 608 &> bfs_gh007.txt
./numa-BFS ../maps/gh008.adj 481 &> bfs_gh008.txt
./numa-BFS ../maps/gh009.adj 474 &> bfs_gh009.txt
./numa-BFS ../maps/gh010.adj 464 &> bfs_gh010.txt
./numa-BFS ../maps/gh011.adj 481 &> bfs_gh011.txt
./numa-BFS ../maps/gh012.adj 481 &> bfs_gh012.txt
./numa-BFS ../maps/gh013.adj 856 &> bfs_gh013.txt
./numa-BFS ../maps/gh014.adj 189 &> bfs_gh014.txt
./numa-BFS ../maps/gh015.adj 49599822 &> bfs_gh015.txt
./numa-BFS ../maps/gh016.adj 663 &> bfs_gh016.txt

echo "Done with BFS"

####################    CC    ####################

echo "Start CC"

./numa-Components ../maps/gh001.adj &> cc_gh001.txt
./numa-Components ../maps/gh002.adj &> cc_gh002.txt
./numa-Components ../maps/gh004.adj &> cc_gh004.txt
./numa-Components ../maps/gh005.adj &> cc_gh005.txt
./numa-Components ../maps/gh006.adj &> cc_gh006.txt
./numa-Components ../maps/gh007.adj &> cc_gh007.txt
./numa-Components ../maps/gh008.adj &> cc_gh008.txt
./numa-Components ../maps/gh009.adj &> cc_gh009.txt
./numa-Components ../maps/gh010.adj &> cc_gh010.txt
./numa-Components ../maps/gh011.adj &> cc_gh011.txt
./numa-Components ../maps/gh012.adj &> cc_gh012.txt
./numa-Components ../maps/gh013.adj &> cc_gh013.txt
./numa-Components ../maps/gh014.adj &> cc_gh014.txt
./numa-Components ../maps/gh015.adj &> cc_gh015.txt
./numa-Components ../maps/gh016.adj &> cc_gh016.txt

echo "Done with CC"

####################    PR    ####################

echo "Start PR"

./numa-PageRank ../maps/gh001.adj 10 &> pr_gh001.txt
./numa-PageRank ../maps/gh002.adj 10 &> pr_gh002.txt
./numa-PageRank ../maps/gh004.adj 10 &> pr_gh004.txt
./numa-PageRank ../maps/gh005.adj 10 &> pr_gh005.txt
./numa-PageRank ../maps/gh006.adj 10 &> pr_gh006.txt
./numa-PageRank ../maps/gh007.adj 10 &> pr_gh007.txt
./numa-PageRank ../maps/gh008.adj 10 &> pr_gh008.txt
./numa-PageRank ../maps/gh009.adj 10 &> pr_gh009.txt
./numa-PageRank ../maps/gh010.adj 10 &> pr_gh010.txt
./numa-PageRank ../maps/gh011.adj 10 &> pr_gh011.txt
./numa-PageRank ../maps/gh012.adj 10 &> pr_gh012.txt
./numa-PageRank ../maps/gh013.adj 10 &> pr_gh013.txt
./numa-PageRank ../maps/gh014.adj 10 &> pr_gh014.txt
./numa-PageRank ../maps/gh015.adj 10 &> pr_gh015.txt
./numa-PageRank ../maps/gh016.adj 10 &> pr_gh016.txt

echo "Done with PR"

####################    SSSP    ####################

echo "Start SSSP"

./numa-BellmanFord ../maps/gh001.wadj 126 &> sssp_gh001.txt
./numa-BellmanFord ../maps/gh002.wadj 113 &> sssp_gh002.txt
./numa-BellmanFord ../maps/gh004.wadj 244 &> sssp_gh004.txt
./numa-BellmanFord ../maps/gh005.wadj 460 &> sssp_gh005.txt
./numa-BellmanFord ../maps/gh006.wadj 132 &> sssp_gh006.txt
./numa-BellmanFord ../maps/gh007.wadj 1022 &> sssp_gh007.txt
./numa-BellmanFord ../maps/gh008.wadj 2 &> sssp_gh008.txt
./numa-BellmanFord ../maps/gh009.wadj 3 &> sssp_gh009.txt
./numa-BellmanFord ../maps/gh010.wadj 3 &> sssp_gh010.txt
./numa-BellmanFord ../maps/gh011.wadj 8 &> sssp_gh011.txt
./numa-BellmanFord ../maps/gh012.wadj 10 &> sssp_gh012.txt
./numa-BellmanFord ../maps/gh013.wadj 23 &> sssp_gh013.txt
./numa-BellmanFord ../maps/gh014.wadj 2 &> sssp_gh014.txt
./numa-BellmanFord ../maps/gh015.wadj 24 &> sssp_gh015.txt
./numa-BellmanFord ../maps/gh016.wadj 619 &> sssp_gh016.txt

echo "Done with SSSP"

####################    FIN    ####################

wait

echo "finished polymer!"

exit
