! To compile: gfortran -o invhypo invhypo.f90
module hyp
    contains
    ! calculate the arctanh at real point x with 
    ! a precision error of less than 'delta'
    ! Assume -1 < x < 1 and delta > 0
    function arctanh(x, delta)
        implicit none
        real(kind=8) :: arctanh, x, delta
        integer(kind=8) :: n
        real(kind=8) :: arcTan, elem, val
        arcTan = x; n = 1;
        elem=x
        do while (abs(elem) >= delta)
            val = 2* n + 1
            elem = x**val/val
            arcTan = arcTan + elem
            n = n+1
        end do
        arctanh = arcTan
        return
    end function arctanh

    ! Calculate the arctanh of real x
    ! Assume -1 < x < 1
    function arctanh2(x)
        implicit none
        real(kind=8) :: arctanh2, x
        arctanh2 = (log(1.0+x) - log(1.0-x))/2
        return
    end function arctanh2
end module

program invhypo
    use hyp
    implicit none
    integer(kind=4) :: i, sample, a
    real(kind=8) :: start, finish, prec, j !sample, tan1, tan2, sample
    real, allocatable :: tan1(:), tan2(:)
    ! Reading real x, to compute arctanh(x)
    write(6,*) 'Enter the real in the range [-1, 1]: '
    read(5,*) start, finish
    ! Reading the precision to be applied to the numerical method
    write(6,*) 'Enter the method''s precision: '
    read(5,*) prec
    ! SEt a variable a to the size of the array to store the values
    a = ((abs(start) + abs(finish))/prec) + 1
    j = start
    allocate(tan1(a))
    allocate(tan2(a))
    ! Caluclate arctanh(x) using 2 different methods
    do i=1,a
        tan1(i) = arctanh(j, prec)
        tan2(i) = arctanh2(j)
        ! prints the numerical difference between methods
        write(6,'(a,f10.5)') 'At arctanh', j
        write(6,'(a,f15.10)') 'The difference between methods is ', abs(tan1(i)-tan2(i))
        j = j+prec
    end do

end program invhypo
