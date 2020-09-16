#!/usr/bin/fish

# https://leewc.com/articles/making-past-git-commits/

function commit100
	set fulldatestring $argv[1]" 12:00:00"
	for x in (seq 0 100)
		mkdir -p "dropice"
		set file "dropice/"$argv[1]".txt"
		
		echo "DROP ICE" >> $file
		git add $file

		env GIT_COMMIT_DATE=$fulldatestring GIT_AUTHOR_DATE=$fulldatestring git commit -m "Drop Ice "$argv[1]" #"$x > /dev/null 2>&1
	end
end

if test ! -z "$argv[2]"
	# Not in manual mode anymore if a 2nd argument is present
	if test -z "$argv[3]" -o -z "$argv[4]"
		echo "Usage: datefill <year> <month> <start-day> <end-day>"
		exit
	end

	echo "Range mode. This might take awhile..."

	set year $argv[1]
	set month $argv[2]
	set startday $argv[3]
	set endday $argv[4]

	for dd in (seq $startday $endday)
		set datestring $year"-"$month"-"$dd

		echo "Performing 100 commits on"$datestring"..."
		commit100 $datestring
	end

	exit
end

echo "Performing 100 commits on "$argv[1]"..."
commit100 $argv[1]
