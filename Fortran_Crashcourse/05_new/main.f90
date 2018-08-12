!=============================================================================80
!                       05: Fortran and Loops                                  !
!==============================================================================!
!    Discussion:
!       An essential part of programming is being able to write loops to make
!       iterative calculations.
!       This lesson will review how to create a 'do' and 'do while' loop while
!       also using 'if' and 'else if' statements.
!    Modified
!       9 March 2018
!    Author:
!       Alan Robledo, Shane Flynn
!==============================================================================!
program loops
implicit none
integer :: a, b, i, j, k
real :: c, d
!==============================================================================!
!    Writing a loop in Fortran is very similar, if not the same, as writing a
!    loop in any other programming language because the concept stays the same.
!    You create an environment where Fortran has to go through a series of
!    repeated instructions until a certain criteria is met.
!    This criteria can be set using an 'if' statement.
!    You begin the loop with the 'do' or 'do while' statement.
!    Then you specify a value for the loop to begin in and a value for the
!    loop to end in.
!    If you like, you can even specify the increment that you
!    want Fortran to follow through as it goes through iterating.
!==============================================================================!
!==============================================================================!
!        We create a do loop that will generate two columns of data
!           You can have your output be written as columns by
!                     writing '(output1,output2)'
!==============================================================================!
write(*,*) "          a           b"
do a = 1, 10
  b = 2*a
  write(*,*) (a,b)
end do
!==============================================================================!
!        We create an if statement that will tell Fortran to write
!        a string if the logical expression is evaulated to '.true.'
!==============================================================================!
if (3 .eq. 3) then
  write(*,*) 'Hello World!'
end if
!==============================================================================!
!                You can specify what Fortran should do
!                if your expression is false with 'else'
!==============================================================================!
if (3 .eq. 2) then
  write(*,*) 'Three is equal to two.'
else
  write(*,*) 'Three is equal to three.'
end if
!==============================================================================!
!==============================================================================!
!           If you want to specify a different expression entirely
!                  in case the initial expression is false,
!                            you can use 'else if'
!==============================================================================!
i = 4
do j = -2, 6
  if (i .lt. j) then
    write(*,*) 'i < j'
  else if (i .eq. j) then
    write(*,*) 'i = j'
  else if (i .gt. j) then
    write(*,*) 'i > j'
  end if
end do
!==============================================================================!
!        Fortran's 'do while' loop will do any specified action as
!          long as the logical expression evaluates to '.true.'
!              until the expression evaluates to '.false.'
!==============================================================================!
i = 10
j = 0
do while (i .gt. j)
  write(*,*) 'Continuing'
  j = j + 1
end do
!==============================================================================!
!              Loop increments do not have to be integer values
!                  You can change the loop index increment
!                       by just adding a third number
!==============================================================================!
do c = 1, 2, 0.2
  d = d + c
  write(*,*) 'c =', c
  write(*,*) 'd =', d
end do
end program loops
