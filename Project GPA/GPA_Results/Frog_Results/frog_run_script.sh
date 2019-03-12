#!/bin/bash
#SBATCH -N 1
#SBATCH -p GPU
#SBATCH --gres=gpu:k80:4
#SBATCH -t 06:00:00
#SBATCH --mail-type=ALL

set -x

export OMP_NUM_THREADS=28

echo "frog test"

./exp ../../maps/gh001.mtx.bin 1048576 &> frog_gh001.txt
./exp ../../maps/gh002.mtx.bin 1048576 &> frog_gh002.txt
./exp ../../maps/gh004.mtx.bin 1048576 &> frog_gh003.txt
./exp ../../maps/gh005.mtx.bin 1048576 &> frog_gh004.txt
./exp ../../maps/gh006.mtx.bin 1048576 &> frog_gh005.txt
./exp ../../maps/gh007.mtx.bin 1048576 &> frog_gh007.txt
./exp ../../maps/gh008.mtx.bin 1048576 &> frog_gh008.txt
./exp ../../maps/gh009.mtx.bin 1048576 &> frog_gh009.txt
./exp ../../maps/gh010.mtx.bin 1048576 &> frog_gh010.txt
./exp ../../maps/gh011.mtx.bin 1048576 &> frog_gh011.txt
./exp ../../maps/gh012.mtx.bin 1048576 &> frog_gh012.txt
./exp ../../maps/gh013.mtx.bin 1048576 &> frog_gh013.txt
./exp ../../maps/gh014.mtx.bin 1048576 &> frog_gh014.txt
./exp ../../maps/gh015.mtx.bin 1048576 &> frog_gh015.txt
./exp ../../maps/gh016.mtx.bin 1048576 &> frog_gh016.txt

####################    FIN    ####################

wait

echo "finished frog!"

exit
