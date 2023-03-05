#!/usr/bin/env bash
TEMPLATE_DIR='/home/huyle/Setup_CP/.template'

# for filepath in "$@"; do
filepath=$1
PROBLEM_NAME=$(basename "$filepath")
ROOT_NAME=$2
LANG="cpp"

if [[ -e "$filepath" ]]; then
    echo "$filepath already exists. Remove it and retry."
    continue
fi

if [ $# -eq 2 ]
  then
    LANG="cpp" #default
  else
    LANG=$3
fi

mkdir -p "$filepath"

if [ "$LANG" == "cpp" ]; then
  # Copy files
  cp -r "$TEMPLATE_DIR/template.cpp" "$filepath/"
  mv "$filepath/"template.cpp "$filepath/$PROBLEM_NAME".cpp
  echo "created $PROBLEM_NAME.cpp file"

  if [ "$PROBLEM_NAME" == "$ROOT_NAME" ]
  then
    cp "$TEMPLATE_DIR/debug.h" "."
    cp "$TEMPLATE_DIR/CMakeLists.txt" "."
  fi

  CMAKE_FILE="CMakeLists".txt
  echo "" >> $CMAKE_FILE
  echo "add_executable($PROBLEM_NAME $PROBLEM_NAME/$PROBLEM_NAME.cpp)
  target_include_directories($PROBLEM_NAME PRIVATE ./)" >> $CMAKE_FILE

  if [ "$PROBLEM_NAME" == "$ROOT_NAME" ]
  then
    echo "target_precompile_headers($PROBLEM_NAME
    PUBLIC
      /usr/include/x86_64-linux-gnu/c++/11/bits/stdc++.h
  )" >> $CMAKE_FILE
  else
    echo "target_precompile_headers($PROBLEM_NAME REUSE_FROM $ROOT_NAME)" >> $CMAKE_FILE
  fi
elif [ "$LANG" == "java" ]; then
  cp -r "$TEMPLATE_DIR/Template.java" "$filepath/"
  sed -i 's/Template/'$PROBLEM_NAME'/' "$filepath/"Template.java
  mv "$filepath/"Template.java "$filepath/$PROBLEM_NAME".java
  echo "created $PROBLEM_NAME.java file"
elif [ "$LANG" == "python" ]; then
  cp -r "$TEMPLATE_DIR/template.py" "$filepath/"
  mv "$filepath/"template.py "$filepath/$PROBLEM_NAME".py
  echo "created $PROBLEM_NAME.py file"
fi
