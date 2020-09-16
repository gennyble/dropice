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

weekday=$(date --date=$startdate +%a)

if [ "$weekday" != "Sun" ]
then
  echo "Date does not fall on a Sunday, refusing to run!"
  exit
fi

# Short for last_week
function lw () {
  if [ -n $1 ]
  then
    lastweek=$(date --date=$1"-1 weeks" +%F)
  else
    lastweek=$(date --date=$lastweek"-1 weeks" +%F)
  fi

  echo $lastweek
}

function yesterday () {
  date --date=$1"-1 day" +%F
}

function tomorrow () {
  date --date=$1"+1 day" +%F
}

function commit100 () {
  fulldatestring=$1" 12:00:00"
  echo "Performing 100 commits on $1 for $word..."
  for x in $(seq 0 10)
  do
    mkdir -p "${word}ice"
    file="${word}ice/$1.txt"

    echo "${word^^} ICE" >> $file
    git add $file

    GIT_COMMIT_DATE=$fulldatestring GIT_AUTHOR_DATE=$fulldatestring git commit -m "${word^} Ice $1 #"$x > /dev/null 2>&1
  done
}

# Short for write_horizontal
function wh () {
  pattern=$1
  week=$2

  day=$week

  pattern=$(echo -n $pattern | rev)
  for c in $(echo $pattern | sed -e 's/\(.\)/\1\n/g')
  do
    day=$(yesterday $day)

    if [ $c = "X" ]
    then
      commit100 $day
    fi
  done
  echo ""
}

if [ "$word" == "drop" ]
then
  wh "X.....X" $startdate
  wh "X..X..X" $(lw $startdate)
  wh "XXXXXXX" $(lw)
  wh "......." $(lw)
  wh "X.....X" $(lw)
  wh "X.....X" $(lw)
  wh "XXXXXXX" $(lw)
  wh "......." $(lw)
  wh "X.....X" $(lw)
  wh "XXXXXXX" $(lw)
  wh "X.....X" $(lw)
  wh "......." $(lw)
  wh "......." $(lw)
  wh "......." $(lw)
  wh "XXX...." $(lw)
  wh "X.X...." $(lw)
  wh "XXXXXXX" $(lw)
  wh "......." $(lw)
  wh ".XXXXX." $(lw)
  wh "X.....X" $(lw)
  wh ".XXXXX." $(lw)
  wh "......." $(lw)
  wh "XXX.XXX" $(lw)
  wh "X..X..." $(lw)
  wh "XXXXXXX" $(lw)
  wh "......." $(lw)
  wh ".XXXXX." $(lw)
  wh "X.....X" $(lw)
  wh "XXXXXXX" $(lw)
fi

if [ "$word" == "abolish" ]
then
  wh "X.....X" $startdate
  wh "X..X..X" $(lw $startdate)
  wh "XXXXXXX" $(lw)
  wh "......." $(lw)
  wh "X.....X" $(lw)
  wh "X.....X" $(lw)
  wh "XXXXXXX" $(lw)
  wh "......." $(lw)
  wh "X.....X" $(lw)
  wh "XXXXXXX" $(lw)
  wh "X.....X" $(lw)
  wh "......." $(lw)
  wh "......." $(lw)
  wh "......." $(lw)
  wh "XXXXXXX" $(lw)
  wh "...X..." $(lw)
  wh "XXXXXXX" $(lw)
  wh "......." $(lw)
  wh "X..XXX." $(lw)
  wh "X..X..X" $(lw)
  wh ".XX...X" $(lw)
  wh "......." $(lw)
  wh "X.....X" $(lw)
  wh "XXXXXXX" $(lw)
  wh "X.....X" $(lw)
  wh "......." $(lw)
  wh "......X" $(lw)
  wh "......X" $(lw)
  wh "XXXXXXX" $(lw)
  wh "......." $(lw)
  wh ".XXXXX." $(lw)
  wh "X.....X" $(lw)
  wh ".XXXXX." $(lw)
  wh "......." $(lw)
  wh ".XX.XX." $(lw)
  wh "X..X..X" $(lw)
  wh "XXXXXXX" $(lw)
  wh "......." $(lw)
  wh ".XXXXXX" $(lw)
  wh "X..X..." $(lw)
  wh ".XXXXXX" $(lw)
fi
