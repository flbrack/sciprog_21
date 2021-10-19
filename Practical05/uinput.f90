program uinput
    implicit none

    integer (kind=4) :: i
    real (kind=8) :: a
    integer (kind=4), pointer :: px
    integer (kind=4), target :: x

    write(6,*) 'Enter an intger and a double. '
    read(5,*), i, a
    write(6,*) i, a

    x = 10
    px => x

    write(6,*) 'The value x is ', x
    write(6,*) 'The value x is also', px
    write(6,*) 'The address of x is ', loc(x)

end program uinput
