#!/bin/bash -x
declare -A myDict
countHH=0
countHT=0
countTT=0
countTH=0
total=10
for (( count=1 ; count<=$total ; count++ ))
do
        coinFlip1=$((RANDOM %2))
	coinFlip2=$((RANDOM %2))
	case $coinFlip1 in
	0)
		case $coinFlip2 in
		0)
			echo "TT"
			myDict[$count]="TT"
			(( countTT++ ));;
		*)
			echo "TH"
			myDict[$count]="TH"
			(( countTH++ ));;
		esac;;
	*)
		case $coinFlip2 in
		0)
			echo "HT"
			myDict[$count]="HT"
			(( countHT++ ));;
		*)
			echo "HH"
			myDict[$count]="HH"
			(( countHH++ ));;
		esac;;
	esac
done
echo ${myDict[@]}
echo "Percentage of TT: "`awk 'BEGIN{print '$countTT'/'$total'}'`	#$(( $countTT/$total ))
echo "Percentage of HH: "`awk 'BEGIN{print '$countHH'/'$total'}'`	#$(( $countHH/$total ))
echo "Percentage of HT: "`awk 'BEGIN{print '$countHT'/'$total'}'`       #$(( $countHT/$total ))
echo "Percentage of TH: "`awk 'BEGIN{print '$countTH'/'$total'}'`       #$(( $countTH/$total ))
