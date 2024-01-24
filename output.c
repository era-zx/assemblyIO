#include<stdio.h>
#include<stdlib.h>
#include<time.h>
int main (){
	srand(time(NULL)); //seed a Random Class using the current time for variable output
	int value = rand() % 2; //use the modulo operator to get value of 0 or 1 depending on eveness of random number
	printf("The random value of the time-dependant randomized 0 or 1 return value C program is: %d\n", value);
	return value; //main ret val
}
