#edward ramos - asm and c makefile
ASM = as
LD = ld
CXX = gcc

all: output result
result: result.o
	$(LD) $(LDFLAGS) -o result $^ 
result.o: #hello.s
	$(ASM) -o result.o result.s

output:
	$(CXX) -o output output.c
clean:
	rm -f output result *.o

