#!/bin/bash -x
declare -A myDict
countH=0
countT=0
total=5
for (( count=1 ; count<=$total ; count++ ))
do
        coinFlip=$((RANDOM %2))
        if (( ($coinFlip==0) )); then
                echo "Tails"
		myDict[$count]=T
		countT=$((countT+1))
	else
                echo "Heads"
		myDict[$count]=H
		countH=$((countH+1))
        fi
done
echo ${myDict[@]}
echo "Percentage of Tails: "`awk 'BEGIN{print '$countT'/'$total'}'`	#$(( $countT/$total ))
echo "Percentage of Heads: "`awk 'BEGIN{print '$countH'/'$total'}'`	#$(( $countH/$total ))
