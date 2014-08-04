all : test.js

clean :
	rm -f *.o *.a *.js *.map

test.js : test.c libtest.a
	emcc -s ERROR_ON_UNDEFINED_SYMBOLS=1 -L. -ltest -o test.js test.c

libtest.a : testlib.c
	emcc -c -o testlib.o testlib.c
	emar rcs libtest.a testlib.o
