! To compile: gfortran -o magic_sq_file magic_sq_file.f90
include 'magic_square.fh'

program magsq
    use msquare
    implicit none
    integer (kind=4) :: n, i, ierr, num(100)
    integer (kind=4), allocatable :: magicSquare(:,:)
    character (len=6) :: text
    character (len=100) :: filename, line

    ! Code for getting values from a file

    ! Open the file

    write(6,*) 'Enter the file name with the square matrix'
    read(5,*) filename

    ierr = 0
    open(unit=1,file=filename,form='FORMATTED',access='SEQUENTIAL',action='READ',status='OLD',iostat=ierr)

    if (ierr /= 0) then
        write(6,*) 'Sorry cannot find file ', filename
        goto 20
    endif

    ! First line has n

    n = 0
    do while(ierr==0)
        read(1,*,iostat=ierr) line
        n = n+1
    enddo
    n = n-1
    write(6,*) 'n = ',n
    rewind(unit=1)

    if (n <= 0) goto 10

    ! Allocating a matrix for storing the magic square
    ! as an array of pointers, where each pointer is a row

    allocate(magicSquare(n,n))

    ! read in the rows for each line

    do i=1,n
        read(1,*,iostat=ierr) magicSquare(i,:)
    enddo

    if (ierr /= 0) then
        write(6,*) 'Cannot read in matrix correctly. Stopping!'
        goto 10
    endif

    if (isMagicSquare(magicSquare,n)) then
        text = 'is'
    else
        text = 'is NOT'
    endif
    write(6,*) 'This square ', trim(text), ' magic'

    !Freeing each row separately before freeing the array of pointers
    deallocate(magicSquare)
10  continue
    close(unit=1, status='KEEP')
20  stop
end program magsq
