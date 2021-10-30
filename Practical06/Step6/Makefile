FC = gfortran
FCFLAGS = -O3
LDFLAGS = -lm

#Name of output file
all: mmf

#Linking step
mmf: main.o matmult.o
	$(FC) -o $@ $^ $(LDFLAGS)
##$(FC) -o mmf main.o matmult.o $(LDFLAGS)

#Compiling function file
matmult.o: matmult.f90
	$(FC) -c $(FCFLAGS) $<
##$(FC) -c $(FCFLAGS) matmult.f90

#Compiling main file
main.o: main.f90
	$(FC) -c $(FCFLAGS) $<
##$(FC) -c $(FCFLAGS) main.f90

#Cleaning up folder
clean:
	rm *.o *.mod

