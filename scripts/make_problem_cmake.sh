#!/usr/bin/env bash
TEMPLATE_DIR='/home/huyle/.template/'

for filepath in "$@"; do
    PROBLEM_NAME=$(basename "$filepath")

    if [[ -e "$filepath" ]]; then
        echo "$filepath already exists. Remove it and retry."
        continue
    fi

    # Copy files in
    mkdir -p "$filepath"
		cp -r "$TEMPLATE_DIR/"* "$filepath/"
		mv "$filepath/"template.cpp "$filepath/$PROBLEM_NAME".cpp
		echo "created $PROBLEM_NAME.cpp file"
		
		# rename PROBLEM_NAME in file CMakeLists.txt
		sed -i "s/PROBLEM_NAME/$PROBLEM_NAME/g" "$filepath"/CMakeLists.txt
		
		# Run cmake
    BUILD_DIR="${filepath}/build"
    mkdir "$BUILD_DIR"
		cd "$BUILD_DIR"
		cmake ..

    # Build the first time for precompiled header
    echo "First built for precompiled header, maybe slower than normal"
    make "$PROBLEM_NAME"
    cd ../../
done

