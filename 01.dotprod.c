#include <stdio.h>
#include <stdlib.h>

double dotprod(double *restrict a, double *restrict b, unsigned long long n)	{
	double d = 0.0;
	for ( unsigned long long i = 0; i < n; i+=4)	{
		d += ( *(a+i) * *(b+i) );
		d += ( *(a+i+1) * *(b+i+1) );
		d += ( *(a+i+2) * *(b+i+2) );
		d += ( *(a+i+3) * *(b+i+3) );
	}
	return d;	
}

void fill_vector (double *restrict vect, unsigned long long n)	{
	for (unsigned long long i = 0; i < n; i+=4)	{
		*(vect+i) = 1;
		*(vect+i+1) = 1;
		*(vect+i+2) = 1;
		*(vect+i+3) = 1;
	}
}

int main ( int argc, char ** argv)	{
	if ( argc == 1) return 1;
	
	// Size of vectors
	unsigned long long n = atoll ( argv[1]);
	unsigned long long n_b = n/sizeof(double);

	printf ("%llu\n", n);

	// Allocate memory for vectors
	double	* a = malloc ( n),
		* b = malloc ( n),
		res = 0.0;
			
	// Init vector values		
	fill_vector ( a, n_b);
	fill_vector ( b, n_b);
	
	
	// Doing a dotprod
	for ( int i = 0; i < 10000; i++)
		res = dotprod ( a, b, n_b);


	// Free memory
	free ( a);
	free ( b);

	// Print dotprod result
	printf ("Res : %lf\n", res);
	
	return 0;
}
