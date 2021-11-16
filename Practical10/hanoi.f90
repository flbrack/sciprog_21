! To compile: gfortran -o hanoi hanoi.f90
recursive subroutine hanoi(n, source, dest, inter)
    integer (kind=4), intent(in) :: n, source, dest, inter

    ! Base case when there is only 1 disc
    if (n == 1) then
        write(6,fmt='(a,i2,a,i2,a,i2)') 'Moved disc',n,' from ',source,' to ',dest
        return

    ! recursive case, where we call subroutine for n-1 discs
    else
        call hanoi(n-1, source, inter, dest)
        write(6,'(a,i2,a,i2,a,i2)') 'Moved disc',n,' from ',source,' to ',dest
        call hanoi(n-1, inter, dest, source)
    endif
end subroutine hanoi

program hanoi_prog
    implicit none
    integer (kind=4) :: h

    ! Ask user for number of discs
    write(6,*) 'Enter number of discs. '
    read(5,*) h
    write(6,'(a,i2,a)') 'Tower of hanoi solution for ',h,' discs:'

    ! Call recursive function
    call hanoi(h,1,3,2)
end program hanoi_prog
