! To compile: gfortran -o uinput uinput.f90
program uinput
    implicit none

    integer (kind=4) :: i
    real (kind=8) :: a
    integer (kind=4), pointer :: px
    integer (kind=4), target :: x

    ! We ask for input and then read it in
    write(6,*) 'Enter an intger and a double. '
    read(5,*), i, a
    write(6,*) i, a

    x = 10
    px => x

! We write show how pointers are written to output
    write(6,*) 'The value x is ', x
    write(6,*) 'The value x is also', px
    write(6,*) 'The address of x is ', loc(x)

end program uinput
