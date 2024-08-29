#! bin/bash
files=$(grep -o 'match_type: T20' * | sed 's/:m.*$//'| grep '.yaml')
for file in $files
do
	var=$(sed "s/.yaml// " <<< "$file")
	mkdir $var
	awk -v path="$var" -f script.awk $file
done
