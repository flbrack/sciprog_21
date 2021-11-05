function factorial(n) result(fact)
    integer, intent(in) :: n

    integer :: i

    if (n < 0) error stop 'factorial is singular for negative values'
    fact = 1.0
    do i=2,n
        fact = fact*i
    enddo
end function

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

    write(6,*) 'Enter the order of the polynomial'
    read(5,*) order_poly

    size_of_array = order_poly + 1
    allocate(array_of_terms(size_of_array),stat=ierr)


    do i=1,size_of_array
        array_of_terms(i) = compute_polynomial(x,i-1)
        write(6,'(a,i2,a,f20.15)') 'f[',i-1,'] = ', array_of_terms(i)
    enddo

    write(6,*) 'a1 = ', exp(1.)

    do i=1,size_of_array
        write(6,'(a,i2,a,f20.15)') 'Difference in estimate for term ', i-1, ' is ', exp(1.) - array_of_terms(i)
    enddo

    deallocate(array_of_terms)

end program polynomial
