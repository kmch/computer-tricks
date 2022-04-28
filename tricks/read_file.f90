program read_file

real :: matrix(3,3)
integer :: i, j

open(10, file = 'matrix.txt', status = 'old')

!do i = 1, 3
!  do j = 1,3
!
!    read(10, *) matrix(i, j)
!    print*, matrix(i, j)
!  end do
!end do

read(10, *) matrix
print*, matrix

close(10)

end program read_file
