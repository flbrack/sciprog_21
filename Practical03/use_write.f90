! To compile: gfortran -o use_write use_write.f90
program use_write
    implicit none
    
    integer(kind=4) :: i1 = 10, i2=100
    real(kind=4) :: f1=1.11, f2=2.2222

    write(6,'(a, i3, i4, a, f5.2, f7.4)') 'Two integers are', i1, i2, ' Two floats', f1, f2

end program use_write

