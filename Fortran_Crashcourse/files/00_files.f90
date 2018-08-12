!=============================================================================80
!                             00: Fortran and Files			       !
!==============================================================================!
!    Discussion:
!	For scientific computing it will be essential to read in data from a 
!	file (or from a user) and to write data to a file.
!	This lesson will review reading data from a file and writing data to a 
!	file. 
!       The program reads in 2 numbers (integers) and adds them together.
!   Input:
!       num_1    => any integer
!       num_2    => any integer
!   Output:
!       sum      => integer, the summation of nu_1 and num_2
!    Modified:
!       9 March 2018
!    Author:
!       Shane Flynn  & Alan Robledo
!==============================================================================!
!==============================================================================!
!                   Define the program name and variables                      !
!==============================================================================!
program reading_00
implicit none
integer :: num_1, num_2, sum
!==============================================================================!
!               The open command tells fortran to open a file                  !
!             The read and write syntax contains 2 arguments  (*,*)            !
!          The first argument specifies a location (given by a number)         !
!        The * essentially says use the default argument for this option       !
!          So we specify an actual file, and a number to call it with          !
!        The number can be anything (usually 20-99) 1-10 are reserved          !
!           The second argument is for formatting (not necessary)              !
!       Once you are done using a file it is good practice to close it         !
!==============================================================================!
!==============================================================================!
!        We specify a file called input.dat and assign it the number 20        !
!       Then read line 1 of the file, and store it to a variable: num_1        !
!       Then read line 2 of the file, and store it to a variable: num_2        !
!                           Finally we close the file                          !
!                 input.dat MUST exist before you run the code                 !    
!==============================================================================!
open(20, file='input.dat')
read(20,*) num_1
read(20,*) num_2
close(20)
!==============================================================================!
!                The numbers are now stored as variables                       !
!                        we can write then to screen                           !
!==============================================================================!
write(*,*) 'the first number is => ', num_1
write(*,*) 'the second number is => ', num_2
!==============================================================================!
!                We next compute the summation of the two numbers              !
!==============================================================================!
sum = num_1 + num_2
write(*,*) 'the summation is', sum
!==============================================================================!
!               We can now write out answer to a new file                      !
!              Define a new file and write the answer to it                    !
!       The file 'output.dat' does not need to exist before running the code   !
!           Fortran will make a new file if it does not exist                  !
!==============================================================================!
open(55, file='output.dat')
write(55,*) sum
close(55)
end program reading_00
