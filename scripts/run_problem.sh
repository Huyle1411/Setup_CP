#!/bin/bash

# to color the output text in different colours
green=$(tput setaf 71);
red=$(tput setaf 1);
blue=$(tput setaf 32);
orange=$(tput setaf 178);
bold=$(tput bold);
reset=$(tput sgr0);

execute_file=$1
right_answer=0
test_case=1
for input_file in *.in
do
	filename=$(basename -- "$input_file")
	filename="${filename%.*}"
	output_file="${filename}.res"
	expected_file="${filename}.out"
	./$execute_file < $input_file > $output_file
	if diff -B -F --label --side-by-side $expected_file $output_file > dont_show_on_terminal.txt; then
		echo "Test case $test_case: ${bold}${green}Accepted${reset}"
		right_answer=$((right_answer+1))
		test_case=$((test_case+1))
		rm $output_file
	else
		echo "Test case $test_case: ${bold}${red}Wrong Answer${reset}"
    echo "${blue}Input: ${reset}"
		cat $input_file
		echo ""

    echo "${blue}Output: ${reset}"
		cat $output_file
		echo ""

    echo "${blue}Expected: ${reset}"
		cat $expected_file
		echo ""
	fi
done

echo "Testing complete!"
echo "${bold}${green}${right_answer}${reset} test cases passed"

rm dont_show_on_terminal.txt
