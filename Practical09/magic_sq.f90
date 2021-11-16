! To compile: gfortran -o magic_sq magic_sq.f90
include 'magic_square.fh'

program magsq
    use msquare
    implicit none
    integer (kind=4) :: n, i
    integer (kind=4), allocatable :: magicSquare(:,:)
    character (len=6) :: text

    ! Get user input for size of magic square
    n = 0
    do while (n <= 0)
        write(6,*) 'Enter the square side:'
        read(5,*) n
    enddo

    ! Allocating a matrix for storing the magic square
    ! as an array of pointers, where each pointer is a row

    allocate(magicSquare(n,n))

    ! Inputting integer data into the matrix
    do i=1,n
        write(6,*) 'Enter the elements in row ',i,' separated by blank spaces or line breaks'
        read(5,*) magicSquare(i,:)
    enddo

    ! Check is square magic using header function
    if (isMagicSquare(magicSquare,n)) then
        text = 'is'
    else
        text = 'is not'
    endif
    ! Write result to output
    write(6,*) 'This square ', trim(text), ' magic.'

    ! Freeing each row separately before freeing the array of pointers
    deallocate(magicSquare)
    stop
end program magsq
