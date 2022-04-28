program spit_out

! VARIABLE DECLARATION
integer :: i, j
real :: matrix(3,3)
!!

! MAIN
open(10, file = 'matrix.txt') 

do i = 1, 3
  do j = 1, 3
    !print*, i, j
    calc = (i + j) / 2.0 ! NOT 2. NOT TO MENTION 2
    matrix(i,j) = calc
    !print*, calc
    print '(f5.3)', calc
    !write(10, fmt = '(f5.3)') calc
    write(10, fmt = *) calc
  end do
end do


close(10)

!!



end program spit_out
