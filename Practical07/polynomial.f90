! To compile: gfortran -o polynomial polynomial.f90

! Calculates factorial of a given integer
function factorial(n) result(fact)
    integer, intent(in) :: n
    integer :: i

    if (n < 0) error stop 'factorial is singular for negative values'
    fact = 1.0
    do i=2,n
        fact = fact*i
    enddo
end function

! computes the polynomial
real function compute_polynomial(x,n) result(p_sum)
    integer, intent(in) :: n, x
    real :: factor
    integer :: i

    p_sum = 0.0

    do i=0,n
        p_sum = p_sum + (x**i)/factorial(i)
    enddo
end function

program polynomial
    implicit none
    integer :: i, x=1, size_of_array, order_poly, ierr
    real :: compute_polynomial
    real, allocatable :: array_of_terms(:)

    ! Ask user for polynomial order
    write(6,*) 'Enter the order of the polynomial'
    read(5,*) order_poly

    ! allocate array for values
    size_of_array = order_poly + 1
    allocate(array_of_terms(size_of_array),stat=ierr)


    ! call function to compute polynomial and write results to output
    do i=1,size_of_array
        array_of_terms(i) = compute_polynomial(x,i-1)
        write(6,'(a,i2,a,f20.15)') 'f[',i-1,'] = ', array_of_terms(i)
    enddo

    ! Write the theoretical value
    write(6,*) 'a1 = ', exp(1.)

    ! Write the difference between computed values and theoretical
    do i=1,size_of_array
        write(6,'(a,i2,a,f20.15)') 'Difference in estimate for term ', i-1, ' is ', exp(1.) - array_of_terms(i)
    enddo

    ! free memory at end of program
    deallocate(array_of_terms)

end program polynomial
