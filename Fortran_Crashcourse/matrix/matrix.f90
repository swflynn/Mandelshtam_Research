! The resulting matrix should look like this:
! 1 2 0 0
! 3 1 2 0
! 0 3 1 2
! 0 0 3 1
! The main diagonal has ones. The upper diagonal has twos. The lower diagonal
! has threes.

program matrix
 implicit none

 integer :: i
 integer, allocatable :: a(:,:)

 allocate( a(4,4) )
 a = 0

! Fortran arrays are 'backwards' a(1,2) = column 1 row 2

! The first 2 elements of the first column and the last 2 elements of the last
! column should be populated before creating the loop because the first column
! does not have a 2 and the last column does not have a 3.
 a(1,1) = 1
 a(1,2) = 3

 a(4,3) = 2
 a(4,4) = 1

! The loop can then be done such that it starts on the second column and ends
! on the third since the first and fourth are already populated.
 do i = 2,3
   a(i,i-1) = 2
   a(i,i) = 1
   a(i,i+1) = 3
 end do

 write(*,*) a

end program matrix
