! To compile: gfortran -o gcd gcd.f90
module gcdfunctions
    interface
    function iterativeGCD(a,b) result(answer)
        integer, intent(in) :: a,b
        integer :: temp, tempa, tempb, answer
    end function
    recursive function recursiveGCD(a,b) result(answer)
        integer, intent(in) :: a,b
        integer :: answer
    end function
    end interface
end module gcdfunctions

program gcd
    use gcdfunctions
    implicit none
    integer :: num1, num2, error
    logical :: test

    error = 2
    write(6,*) 'Please input two positive integers'
    do while (error /= 0)
        read(5,*,iostat=error) num1, num2
        if (error /= 0) then
            write(6,*) 'Please try again'
        endif
    enddo

    if (num1 < 0 .or. num2 < 0) then
        write(6,*) 'These numbers are not positive!'
    endif

    write(6,'(a,i2,a,i2,a,i2)') 'Iterative GCD(',num1,',',num2,') = ', iterativeGCD(num1,num2)

    write(6,'(a,i2,a,i2,a,i2)') 'Recursive GCD(',num1,',',num2,') = ', recursiveGCD(num1,num2)

end program gcd

function iterativeGCD(a,b) result(answer)
    integer, intent(in) :: a,b
    integer :: temp, tempa, tempb, answer

    tempa = a
    tempb = b

    do while(tempb /= 0)
        temp = tempb
        tempb = mod(tempa, tempb)
        tempa = temp
    enddo

    answer = tempa

end function

recursive function recursiveGCD(a,b) result(answer)
    integer, intent(in) :: a,b
    integer :: answer

    if (b == 0) then
        answer = a
    else
        answer = recursiveGCD(b,mod(a,b))
    endif
    return
end function

