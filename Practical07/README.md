# Practical 7

This week we looked at using arrays where the size is set at runtime, not compile time.

We used allocatable arrays to calculate the number e, in the code
polynomial.f90. We did this using a polynomial approximation. We saw that as
the order of the polynomial grew, the error decreased, until around order 15.
Then, with the fortran code, the error stayed the same. This is most likely due to the finite precision of floating point numbers.

Then in the code mem_alloc.f90, we created some subroutines for easily allocating, deallocating and intialising arrays, using pointers.
