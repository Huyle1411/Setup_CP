#!/bin/bash

# to color the output text in different colours
green=$(tput setaf 71);
red=$(tput setaf 1);
blue=$(tput setaf 32);
orange=$(tput setaf 178);
bold=$(tput bold);
reset=$(tput sgr0);

dist=$(( ($(tput cols) - 2)/3 ))
CUSTOMTAB=''
for ((i=1; i<=$dist; i++))
do
  echo "$i times"
  CUSTOMTAB+=' '
done

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
	# if diff -w -B -F --label --side-by-side $expected_file $output_file > dont_show_on_terminal.txt; then
  if diff <(grep -vE '^\s*$' $expected_file) <(grep -vE '^\s*$' $output_file) > dont_show_on_terminal.txt; then
		echo "Test case $test_case: ${bold}${green}Accepted${reset}"
		right_answer=$((right_answer+1))
		rm $output_file
	else
		echo "Test case $test_case: ${bold}${red}Wrong Answer${reset}"
    echo "${blue}Input: ${reset}"
		cat $input_file
		echo ""

    echo "${blue}Output: ${reset}${CUSTOMTAB}${blue}Expected: ${reset}"
    colordiff -y <(grep -vE '^\s*$' $expected_file) <(grep -vE '^\s*$' $output_file)

		# cat $output_file
		# echo ""
		#
  #   echo "${blue}Expected: ${reset}"
		# cat $expected_file
		# echo ""
	fi
	test_case=$((test_case+1))
done

echo "Testing complete!"
echo "${bold}${green}${right_answer}${reset} test cases passed"

# rm dont_show_on_terminal.txt
