Need to install Vundle to use Vim plugins

Lines to place in .bashrc:

- ulimit -s unlimited (Removes stack size limit)
- export PATH=$PATH:~/scripts/ (Enables scripts)

Scripts (place in ~/scripts)
- build.sh

    Format: build.sh A
    
    Compiles A.cpp into output file A
    
- stress.sh

    Format: stress.sh generator solutionA(original) solutionB(brute-force) numTests
    
    Runs solutionA and solutionB against test cases output by generator and outputs a test on which they give different results

Precompiled header
cd /usr/include/x86_64-linux-gnu/c++/{version}

sudo g++ stdc++.h -g -std=c++2a -O2 -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -Wno-unused-result -Wno-sign-conversion -fsanitize=address -fsanitize=undefined -fsanitize=float-divide-by-zero -fsanitize=float-cast-overflow -fno-sanitize-recover=all -fstack-protector-all -D_FORTIFY_SOURCE=2 
