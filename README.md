The purpose of this program was to be more acclimated to IO operations using low-level assembly and C language on Linux. The C program creates a randomized integer of 0 or 1 to be returned by main, symbolically representing a more complicated potential input program’s success or failure. 

The assembly result program waits for the result to be delivered through standard input and delivers 1 of 2 standard output strings that are dependent on the C program’s success or failure.
The assembly program here for demonstration uses only a 2-byte input buffer for 1 digit and 1 newline which will cause problems and is not usable with non-single digit inputs and especially those beginning or ending with 0 e.g. 007 or 700. This could be fixed using a larger input buffer with a loop and additional error checking beyond the scope of this demo. I may just go ahead and add it at a later date.

The 2 programs are compiled and cleaned with a single makefile using the provided bash shell script.

