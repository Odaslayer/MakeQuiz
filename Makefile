CC=g++
CFLAGS=-c -Wall

all: build doc

build: college

doc: doc/html

doc/html: *.cc *.h
	doxygen Doxyfile

college: collegemain.o course.o college.o
	$(CC) collegemain.o course.o college.o -o college

collegemain.o: collegemain.cc tarray.h node.h
	$(CC) $(CFLAGS) collegemain.cc

course.o: course.cc course.h 
	$(CC) $(CFLAGS) course.cc

college.o: college.cc college.h
	$(CC) $(CFLAGS) college.cc

clean:
	- rm *.o college
	- rm -rf doc/html doc/latex
