module fib
    contains
    subroutine fibo(pa,pb)
        integer (kind=8), pointer :: pa, pb

        !integer (kind=8), target :: a, b
        integer (kind=8) :: next

        !pa => a
        !pb => b

        next = pa+pb

        pa=pb
        pb=next
    end subroutine fibo
end module

program fibonacci
    use fib
    implicit none
    integer (kind=8) :: n, i
    integer (kind=8), pointer :: pn1, pn2
    integer (kind=8), target :: n1=0, n2=1
    pn1 => n1
    pn2 => n2
    ! Get user to enter a number
    write(6,*) 'Enter a positive integer'
    read(5,*) n
    ! Check the number is positive, terminate if not
    if (n < 1) then
        write(6,*) 'The number is not positive'
        stop
    endif
    write(6,*) 'The fibonacci sequence is : '
    write(6,'(i0,a)', advance='NO'), n2,', '

    do i=2,n-1
        call fibo(pn1,pn2) ! get next #

        write(6,'(i0,a)', advance='NO') pn1, ', '
        if (mod((i+1),10) == 0) write(6,*) ! Put in line breaks
    end do
    ! last term
    call fibo(pn1, pn2)
    write(6,'(i0,a)') pn1
end program fibonacci
