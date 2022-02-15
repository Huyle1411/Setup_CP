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
