#!/usr/bin/bash

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]
then
  echo "Usage: dropice <year> <month> <day>"
  echo "Must be on a sunday!"

  exit
fi


year=$1
month=$2
day=$3
word=${4,,}
if [ -z $word ]
then
  word="drop"
fi

startdate=$year"-"$month"-"$day
lastweek=$startdate

weekday=$(date --date=$startdate +%a)

if [ "$weekday" != "Sun" ]
then
  echo "Date does not fall on a Sunday, refusing to run!"
  exit
fi


function commit100 () {
  fulldatestring="$1 12:00:00"
  echo "Performing 100 commits on $1 for $word..."
  for x in $(seq 0 10)
  do
    mkdir -p "${word}ice"
    file="${word}ice/$1.txt"

    echo "${word^^} ICE" >> $file
    git add $file

    export GIT_COMMIT_DATE=$fulldatestring GIT_AUTHOR_DATE=$fulldatestring && git commit -m "${word^} Ice $1 #"$x > /dev/null 2>&1
  done
}

# Short for write_horizontal
function wh () {
  pattern=$1
  week=$lastweek
  day=$week

  pattern=$(echo -n $pattern | rev)
  for c in $(echo $pattern | sed -e 's/\(.\)/\1\n/g')
  do
    day=$(date --date=$day"-1 day" +%F)

    if [ $c = "X" ]
    then
      commit100 $day
    fi
  done
  lastweek=$(date --date=$lastweek"-1 weeks" +%F)
}

if [ "$word" == "drop" ]
then
  wh "X.....X"
  wh "X..X..X"
  wh "XXXXXXX"
  wh "......."
  wh "X.....X"
  wh "X.....X"
  wh "XXXXXXX"
  wh "......."
  wh "X.....X"
  wh "XXXXXXX"
  wh "X.....X"
  wh "......."
  wh "......."
  wh "......."
  wh "XXX...."
  wh "X.X...."
  wh "XXXXXXX"
  wh "......."
  wh ".XXXXX."
  wh "X.....X"
  wh ".XXXXX."
  wh "......."
  wh "XXX.XXX"
  wh "X..X..."
  wh "XXXXXXX"
  wh "......."
  wh ".XXXXX."
  wh "X.....X"
  wh "XXXXXXX"
fi

if [ "$word" == "abolish" ]
then
  wh "X.....X"
  wh "X..X..X"
  wh "XXXXXXX"
  wh "......."
  wh "X.....X"
  wh "X.....X"
  wh "XXXXXXX"
  wh "......."
  wh "X.....X"
  wh "XXXXXXX"
  wh "X.....X"
  wh "......."
  wh "......."
  wh "......."
  wh "XXXXXXX"
  wh "...X..."
  wh "XXXXXXX"
  wh "......."
  wh "X..XXX."
  wh "X..X..X"
  wh ".XX...X"
  wh "......."
  wh "X.....X"
  wh "XXXXXXX"
  wh "X.....X"
  wh "......."
  wh "......X"
  wh "......X"
  wh "XXXXXXX"
  wh "......."
  wh ".XXXXX."
  wh "X.....X"
  wh ".XXXXX."
  wh "......."
  wh ".XX.XX."
  wh "X..X..X"
  wh "XXXXXXX"
  wh "......."
  wh ".XXXXXX"
  wh "X..X..."
  wh ".XXXXXX"
fi
