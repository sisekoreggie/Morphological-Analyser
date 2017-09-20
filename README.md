# Morphological-Analyser
IsiXhosa Morphological Analyser

1. Download and Install the SFST (Stuttgart Finite-State Transducer) tool for linux at 
   http://www.cis.uni-muenchen.de/~schmid/tools/SFST/
2. To compile the verbs.fst: fst-compiler verbs.fst verbs.a 
   then to run: fst-mor verbs.a => this allows you to enter single words to the transducer

Us the SPellChecker.java file to read a textfile with a bunch of words and then output whether they are correctly spelled or not. Modify it according to your own usage and note that the line "Process p = Runtime.getRuntime().exec("fst-infl tester.a input.txt output.txt");" should be modified such that tester.a = the file that you want to use when running the program and then your output will be stored in the file called "output.txt"
