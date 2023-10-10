while true; do
	echo -e "\n"
	echo "choose which to proceed:"
	echo "1. List the subject ID (identity) for all HSPs"
	echo "2. List the alignment length and percent ID for all HSPs"
	echo "3. Show the HSPs with more than 20 mismatches"
	echo "4. Show the HSPs shorter than 100 amino acids and with more than 20 mismatches"
	echo "5. List the first 20 HSPs that have fewer than 20 mismatches"
	echo "6. How many HSPs are shorter than 100 amino acids?"
	echo "7. List the top ten highest (best) HSPs."
	echo "8. List the start positions of all matches where the HSP name includes the letters string "AEI"."
	echo "9. How many subject sequences have more than one HSP?"
	echo "10. What percentage of each HSP is made up of mismatches?"
  echo "11. exit"
	read choice
	case "$choice" in
		1)
		head -n 4 blastoutput2.out
		;;

		2)
		grep -v "#" blastoutput2.out | cut -f4,3 | more
		;;

		3)
		grep -v "#" blastoutput2.out | awk '($5 > 20)' | more
		;;

		4)
		awk '($4 < 100 && $5 > 20 && $1 != "#")' blastoutput2.out | more
		;;

		5)
		awk '($5 < 20 && $1 != "#")' blastoutput2.out | head -n20
		;;

		6)
		awk '($4 < 100 && $1 != "#")' blastoutput2.out | wc -l
		;;

		7)
		grep -v "#" blastoutput2.out | cut -f1,2,12 | head -n 10
		;;

		8)
		cut -f2,7 blastoutput2.out| grep "AEI" | cut -f2
		;;

		9)
		cut -f2 blastoutput2.out | sort | uniq -c | awk '($1 > 1)' | wc -l
		;;

		10)
		grep -v "#" blastoutput2.out | awk '{HSP_mm_pc = ($5/$4) * 100 ; print $1"\t"HSP_mm_pc"%"; }' |  more 
		;;

		11)
		echo "script exited"
		break
		;;

		*)
		echo "invalid, choose again"
		;;
	esac
done