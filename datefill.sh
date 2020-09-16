#!/usr/bin/fish

# https://leewc.com/articles/making-past-git-commits/

set fulldatestring $argv[1]" 12:00:00"

for x in (seq 0 100)
	cat "DROP ICE" > $argv[1]".txt"
	env GIT_COMMIT_DATE=$fulldatestring GIT_AUTHOR_DATE=$fulldatestring git commit -am "Drop Ice "$argv[1]" #"$x
end
