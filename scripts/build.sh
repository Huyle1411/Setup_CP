#!/bin/bash
usage()
{
	echo "Usage: $(basename $0) <filename> [-d] [-c] [-r <number>]" 1>&2 
	exit 1
}

RED='\033[0;31m'
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [[ "$1" == "-h" ]]; then
	usage
fi

filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"
shift

CXXFLAGS="-g -std=c++2a -O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion"
DEBUG_CXXFLAGS="-fsanitize=address -fsanitize=undefined -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize-recover=all -fstack-protector-all -D_FORTIFY_SOURCE=2"
#DEBUG_LOCAL_CXXFLAGS="-D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -DDEBUG -I/home/huyle/library/debug"
DEBUG_LOCAL_CXXFLAGS="-DDEBUG -I/home/huyle/library/debug"

DEBUG=0
COMPILE_ONLY=0
NUMBER_LOOP=1

while getopts ":hdcr:" option; do
	case "$option" in
		h)
			usage
			;;
		d)
			DEBUG=1
			;;
		c)
			COMPILE_ONLY=1
			;;
		r)
			NUMBER_LOOP="$OPTARG"
			;;
	esac
done

if [[ $DEBUG -eq 1 ]]; then
	echo -e "${PURPLE}the DEBUG flags is on${NC}"
	CXXFLAGS+=" ${DEBUG_LOCAL_CXXFLAGS}"
fi

echo -e "${GREEN}Compiling...${NC}"
output=$(g++ $CXXFLAGS -o $filename.out $filename.cpp)
if [[ $? != 0 ]]; then
	echo -e "${RED}***ERROR***${NC}"
elif [[ $COMPILE_ONLY -eq 1 ]]; then
	echo -e "${GREEN}Done${NC}"
else
	for i in $( eval echo {1..$NUMBER_LOOP} ); do
		echo -e "${GREEN}Running...${NC}"
		./$filename.out ;
	done
fi

#g++ -g -std=c++2a -I/home/huyle/library/debug -DDEBUG -O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion -o $1 $1.cpp

