#!/bin/bash

declare -A word_count

while read -r line; do

for word in $line;

do
       ((word_count["$word"]++))
done

done < "/d/devops/test1.txt"

for word in "${!word_count[@]}"; do
        echo "$word: ${word_count[$word]}"
done | sort -t: -k2 -nr | head -n 5
