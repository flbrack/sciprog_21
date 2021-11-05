module subs
    contains
        ! Allocates an array of size n to a pointer to the array
        subroutine allocatearray(array_ptr,n)
            implicit none
            integer(kind=4), intent(in) :: n
            integer(kind=4), pointer, intent(out) :: array_ptr(:)

            write(6,*) ' Allocated array of size ', n
            allocate(array_ptr(n))

            return
        end subroutine allocatearray

        ! Loops through each value of array and fills it with ones
        subroutine fillwithones(array_ptr, n)
            implicit none
            integer(kind=4), intent(in) :: n
            integer(kind=4), pointer, intent(inout) :: array_ptr(:)
            integer(kind=4) :: i

            do i=1,n
            array_ptr(i) = 1
            enddo
            return
        end subroutine fillwithones

        ! Prints the array
        subroutine printarray(array_ptr, n)
            implicit none
            integer(kind=4), intent(in) :: n
            integer(kind=4), pointer, intent(inout) :: array_ptr(:)
            integer(kind=4) :: i

            do i=1,n
            write(6,'(i4)', advance='NO') array_ptr(i)
            enddo
            write(6,*)
            return
        end subroutine printarray

        ! Deallocates the array created and modified in preceding functions
        subroutine deallocatearray(array_ptr)
            implicit none
            integer(kind=4), pointer, intent(inout) :: array_ptr(:)
            deallocate(array_ptr)
            write(6,*) 'Array deallocated'
            return
        end subroutine deallocatearray
end module

program mem_alloc
    use subs
    implicit none
    integer(kind=4) :: n
    integer(kind=4), pointer :: main_p(:)

    write(6,*) ' Enter the number: '
    read(5,*) n

    call allocatearray(main_p,n)
    call fillwithones(main_p,n)
    call printarray(main_p,n)
    call deallocatearray(main_p)
    nullify(main_p)

end program mem_alloc
