#!/bin/bash -x
declare -A myDict
countHHH=0
countHHT=0
countHTT=0
countHTH=0
countTTT=0
countTTH=0
countTHT=0
countTHH=0
total=10
for (( count=1 ; count<=$total ; count++ ))
do
        coinFlip1=$((RANDOM %2))
	coinFlip2=$((RANDOM %2))
	coinFlip3=$((RANDOM %2))
	case $coinFlip1 in
	0)
		case $coinFlip2 in
		0)
			case $coinflip3 in
			0)
				echo "TTT"
				myDict[$count]="TTT"
				(( countTTT++ ));;
			*)
				echo "TTH"
				myDict[$count]="TTH"
				(( countTTH++ ));;
			esac;;
		*)
			case $coinflip3 in
                        0)
                                echo "THT"
                                myDict[$count]="THT"
                                (( countTHT++ ));;
                        *)
                                echo "THH"
                                myDict[$count]="THH"
                                (( countTHH++ ));;
                        esac;;
		esac;;
	*)
		case $coinFlip2 in
                0)
                        case $coinflip3 in
                        0)
                                echo "HTT"
                                myDict[$count]="HTT"
                                (( countHTT++ ));;
                        *)
                                echo "HTH"
                                myDict[$count]="HTH"
                                (( countHTH++ ));;
                        esac;;
                *)
                        case $coinflip3 in
                        0)
                                echo "HHT"
                                myDict[$count]="HHT"
                                (( countHHT++ ));;
                        *)
                                echo "HHH"
                                myDict[$count]="HHH"
                                (( countTHH++ ));;
                        esac;;
                esac;;
	esac
done
echo ${myDict[@]}
echo "Percentage of HTT: "`awk 'BEGIN{print '$countHTT'/'$total'}'`	#$(( $countHTT/$total ))
echo "Percentage of HHH: "`awk 'BEGIN{print '$countHHH'/'$total'}'`	#$(( $countHHH/$total ))
echo "Percentage of HHT: "`awk 'BEGIN{print '$countHHT'/'$total'}'`     #$(( $countHHT/$total ))
echo "Percentage of HTH: "`awk 'BEGIN{print '$countHTH'/'$total'}'`     #$(( $countHTH/$total ))
echo "Percentage of TTT: "`awk 'BEGIN{print '$countTTT'/'$total'}'`     #$(( $countTTT/$total ))
echo "Percentage of THH: "`awk 'BEGIN{print '$countTHH'/'$total'}'`     #$(( $countTHH/$total ))
echo "Percentage of THT: "`awk 'BEGIN{print '$countTHT'/'$total'}'`     #$(( $countTHT/$total ))
echo "Percentage of TTH: "`awk 'BEGIN{print '$countTTH'/'$total'}'`     #$(( $countTTH/$total ))
