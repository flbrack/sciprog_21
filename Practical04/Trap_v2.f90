! To compile: gfortran -o trap_v2 Trap_v2.f90

! module for constant variables
module consts
    integer(kind=4), parameter :: N=12
    real(kind=4) :: pi
end module consts

! module for subroutines
module subroutines
    interface
        subroutine degtorad(deg, rad)
            real(kind=4), intent(in) :: deg
            real(kind=4), intent(out) :: rad
        end subroutine
    end interface
end module subroutines

program Trap_v2
    use consts
    use subroutines
    implicit none

    integer(kind=4) :: i
    real(kind=4) :: TanArr(N+1), deg, rad, area, mult_rad

    ! The value of pi
    pi = atan(1.0)*4.0

    ! Construct tan array
    do i = 1, N+1
        deg = (i-1)*5.0
        call degtorad(deg, rad)
        TanArr(i) = tan(rad)
        write(6,*) 'TanArr[',i,']', TanArr(i)
    end do

    ! Apply trapezoidal rule
    area = TanArr(1) + TanArr(N+1)
    do i=2,N, 1
        area = area + 2.0*TanArr(i)
    end do

    ! Multiply by b-a/2N
    call degtorad((60.0 - 0.0)/(2.0*N), mult_rad)
    area = area * mult_rad

    ! Output approximate answer and real answer
    write(6,*) 'Approximate answer ', area
    write(6,*) 'Real answer ', log(2.0)

end program Trap_v2

subroutine degtorad(deg, rad)
    ! converts degrees to radians
    use consts
    real(kind=4), intent(in) :: deg
    real(kind=4), intent(out) :: rad
    rad = (pi*deg)/180.0
end subroutine degtorad
