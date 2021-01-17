#include <stdio.h>
#include <stdlib.h>

double dotprod(double *restrict a, double *restrict b, unsigned long long n)	{
	double d = 0.0;
	for ( unsigned long long i = 0; i < n; i++)
		d += a[i] * b[i];
	return d;	
}

void fill_vector (double *restrict vect, unsigned long long n)	{
	for (unsigned long long i = 0; i < n; i++)
		vect[i] = 1;
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
