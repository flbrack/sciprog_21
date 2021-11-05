! To compile: make
module functions
    interface
       function matmult(n,p,q,a,b) result(c)
            integer (kind=4) :: i, j, k
            integer (kind=4), intent(in) :: n, p, q
            real (kind=8), intent(in) :: a(n,p), b(p,q)
            real (kind=8) :: c(n,q)
       end function 
    end interface
end module

program matrixmult
    use functions
    implicit none
    integer (kind=4), parameter :: n=5, p=3, q=4
    real (kind=8) :: a(n,p), b(p,q), c(n,q)
    integer (kind=4) :: i, j, k

    ! Initialise A, B and C matrices
    do i=1,n
        do j=1,p
            a(i,j) = i+j
        end do
    end do
    do i=1,p
        do j=1,q
            b(i,j) = i-j
        end do
    end do
    c = 0.0

    c = matmult(n,p,q,a,b)

    ! Print out matrices
    write(6, '(/,a,/,/)') 'This is matrix A'
    do i=1,n
        do j=1,p
            write(6, '(f3.0)', advance='no') a(i,j)
        end do
        write(6,*)
    end do
    write(6, '(/,a,/,/)') 'This is matrix B'
    do i=1,p
        do j=1,q
            write(6, '(f3.0)', advance='no') b(i,j)
        end do
        write(6,*)
    end do
    write(6, '(/,a,/,/)') 'This is matrix C'
    do i=1,n
        do j=1,q
            write(6, '(f5.0)', advance='no') c(i,j)
        end do
        write(6,*)
    end do

end program
