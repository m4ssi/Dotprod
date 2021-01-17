

all: 03.dotprod

00.dotprod:
	gcc -Wall -g -fno-omit-frame-pointer -O0 -o $@ $@.c

01.dotprod:
	gcc -Wall -g -fno-omit-frame-pointer -Ofast -march=native -funroll-loops -floop-unroll-and-jam -ftree-vectorize -fassociative-math -march=core-avx2 -o $@ $@.c

02.dotprod:
	gcc -Wall -g -fno-omit-frame-pointer -Ofast -march=native -funroll-loops -floop-unroll-and-jam -ftree-vectorize -fassociative-math -march=core-avx2 -o $@ $@.c

03.dotprod:
	gcc -Wall -g -fno-omit-frame-pointer -Ofast -march=native -funroll-loops -floop-unroll-and-jam -ftree-vectorize -fassociative-math -march=core-avx2 -o $@ $@.c
