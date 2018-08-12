!=============================================================================80
!                             00: Fortran and Files			       !
!==============================================================================!
!    Discussion:
!       Fortran has 5 intrinsic data types, which have different rules and 
!       applications. 
!   Input:
!       my_int          => any integer
!       my_real         => any integer
!       my_complex      => any integer
!       my_string       => any integer
!       my_logic        => any integer
!   Output:
!       sum      => integer, the summation of nu_1 and num_2
!    Modified:
!       16 March 2018
!    Author:
!       Shane Flynn  & Alan Robledo
!==============================================================================!

program types
implicit none 
integer :: my_int
REAL :: my_real
complex :: my_complex
CHARACTER (LEN=20) :: my_string
logical :: my_logic


write(*,*) 'An integer is just a whole number (no fraction)'
my_int = 7
write(*,*)
write(*,*) my_int
write(*,*)

write(*,*) 'A real (float) in Fortran is a number with a fractional component' 
my_real = 7.0
write(*,*)
write(*,*) my_real
write(*,*)

write(*,*) 'A complex number contains both the real and complex component'
my_complex = (7,2)
write(*,*)
write(*,*) my_complex
write(*,*)

write(*,*) 'A string (character) is for writing text'
my_string = 'words_words_words'
write(*,*)
write(*,*) my_string
write(*,*)

write(*,*) 'Logical variable represent True of False'
my_logic = .true.
write(*,*)
write(*,*) my_logic
write(*,*)

end program types
