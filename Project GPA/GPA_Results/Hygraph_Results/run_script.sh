#!/bin/bash
#SBATCH -N 1
#SBATCH -p GPU
#SBATCH -t 04:00:00
#SBATCH --gres=gpu:k80:4
#SBATCH --mail-type=ALL

set -x

echo "Hygraph"

echo "BFS test"
./main ../../maps/gh001.el bfs &> bfs_gh001.txt
./main ../../maps/gh002.el bfs &> bfs_gh002.txt
./main ../../maps/gh004.el bfs &> bfs_gh004.txt
./main ../../maps/gh005.el bfs &> bfs_gh005.txt
./main ../../maps/gh006.el bfs &> bfs_gh006.txt
./main ../../maps/gh007.el bfs &> bfs_gh007.txt
./main ../../maps/gh008.el bfs &> bfs_gh008.txt
./main ../../maps/gh009.el bfs &> bfs_gh009.txt
./main ../../maps/gh010.el bfs &> bfs_gh010.txt
./main ../../maps/gh011.el bfs &> bfs_gh011.txt
./main ../../maps/gh012.el bfs &> bfs_gh012.txt
./main ../../maps/gh013.el bfs &> bfs_gh013.txt
./main ../../maps/gh014.el bfs &> bfs_gh014.txt
./main ../../maps/gh015.el bfs &> bfs_gh015.txt
./main ../../maps/gh016.el bfs &> bfs_gh016.txt

echo "CC test"
./main ../../maps/gh001.el cc &> cc_gh001.txt
./main ../../maps/gh002.el cc &> cc_gh002.txt
./main ../../maps/gh004.el cc &> cc_gh004.txt
./main ../../maps/gh005.el cc &> cc_gh005.txt
./main ../../maps/gh006.el cc &> cc_gh006.txt
./main ../../maps/gh007.el cc &> cc_gh007.txt
./main ../../maps/gh008.el cc &> cc_gh008.txt
./main ../../maps/gh009.el cc &> cc_gh009.txt
./main ../../maps/gh010.el cc &> cc_gh010.txt
./main ../../maps/gh011.el cc &> cc_gh011.txt
./main ../../maps/gh012.el cc &> cc_gh012.txt
./main ../../maps/gh013.el cc &> cc_gh013.txt
./main ../../maps/gh014.el cc &> cc_gh014.txt
./main ../../maps/gh015.el cc &> cc_gh015.txt
./main ../../maps/gh016.el cc &> cc_gh016.txt

echo "PR test"
./main ../../maps/gh001.el pr &> pr_gh001.txt
./main ../../maps/gh002.el pr &> pr_gh002.txt
./main ../../maps/gh004.el pr &> pr_gh004.txt
./main ../../maps/gh005.el pr &> pr_gh005.txt
./main ../../maps/gh006.el pr &> pr_gh006.txt
./main ../../maps/gh007.el pr &> pr_gh007.txt
./main ../../maps/gh008.el pr &> pr_gh008.txt
./main ../../maps/gh009.el pr &> pr_gh009.txt
./main ../../maps/gh010.el pr &> pr_gh010.txt
./main ../../maps/gh011.el pr &> pr_gh011.txt
./main ../../maps/gh012.el pr &> pr_gh012.txt
./main ../../maps/gh013.el pr &> pr_gh013.txt
./main ../../maps/gh014.el pr &> pr_gh014.txt
./main ../../maps/gh015.el pr &> pr_gh015.txt
./main ../../maps/gh016.el pr &> pr_gh016.txt

echo "SSSP test"
./main ../../maps/gh001.wel sssp &> sssp_gh001.txt
./main ../../maps/gh002.wel sssp &> sssp_gh002.txt
./main ../../maps/gh004.wel sssp &> sssp_gh004.txt
./main ../../maps/gh005.wel sssp &> sssp_gh005.txt
./main ../../maps/gh006.wel sssp &> sssp_gh006.txt
./main ../../maps/gh007.wel sssp &> sssp_gh007.txt
./main ../../maps/gh008.wel sssp &> sssp_gh008.txt
./main ../../maps/gh009.wel sssp &> sssp_gh009.txt
./main ../../maps/gh010.wel sssp &> sssp_gh010.txt
./main ../../maps/gh011.wel sssp &> sssp_gh011.txt
./main ../../maps/gh012.wel sssp &> sssp_gh012.txt
./main ../../maps/gh013.wel sssp &> sssp_gh013.txt
./main ../../maps/gh014.wel sssp &> sssp_gh014.txt
./main ../../maps/gh015.wel sssp &> sssp_gh015.txt
./main ../../maps/gh016.wel sssp &> sssp_gh016.txt

wait

exit
