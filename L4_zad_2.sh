#!/bin/bash


func() {
    x=0
    while [ $x -le 1000 ]
	  do
	      trap '' 1 2 3 4 5 6 7 8 10 11 12 13 14 15 16
	      x=$((x+1))
	      sleep 0.01
	      echo $x
    done
    trap - 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
}

i=1

while :
do
    trap 'echo "SIGALARM"; exit ' 14
    trap 'echo "SIGTERM"' 15
    trap 'echo "SIGUSR1"; func ' 10
    trap '' 12
    i=$((i+1))
    sleep 0.1
done
