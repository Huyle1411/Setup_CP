#!/usr/bin/env bash
TEMPLATE_FILE='/home/huyle/library/template.cpp'

for filepath in "$@"; do
    PROBLEM_NAME=$(basename "$filepath")
		echo $PROBLEM_NAME

    if [[ -e "$filepath" ]]; then
        echo "$filepath already exists. Remove it and retry."
        continue
    fi

    # Copy files in
    mkdir -p "$filepath"
		cp "$TEMPLATE_FILE" "$filepath/sol.cpp"
		echo "created $PROBLEM_NAME.cpp file"
done

