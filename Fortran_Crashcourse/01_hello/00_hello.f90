!=============================================================================80
!                             00: Hello World 				       !
!==============================================================================!
!    Discussion:
!	The first program to run in any new language.
!	The Hello World Program is to learn how to compile and execute code.
!    Modified:
!       16 March 2018
!    Author:
!       Shane Flynn  & Alan Robledo
!==============================================================================!
!              All Fortran programs need to be given a name.		       !
! 	          Make your name meaningful, but short.                        !
!    Programmers use the _ character to imply a space (don't use spaces).      !
!      The ! character is special in Fortran, it is known as a comment.        !
!       Comments are ignored by the compiler, meaning they do nothing.         !
!             Use comments to write notes about your program.                  !
!==============================================================================!
program Hello_World   
!==============================================================================!
! 		implicit none is a special command in Fortran		       !
! 	After naming your program you should immediately write this command    !
!     It allows the user to assign variables to any data type in the program   !
!       Just remember to start every program with a name and implicit none     !
!==============================================================================!
implicit none         
!==============================================================================!
! 		The write command writes something to screen 		       !
!        The (*,*) specifies where and how to write out the information	       !
! 	    For now just remember (*,*) writes something to screen	       !
! 	Note: One is capatilized and one is not, Fortran Does not care         !
! 	   Capital and Lower case letters are the same in Fortran              !
! 	Note: One is indented and one is not, Fortran Does not care            !
!    Fortran doesn't care about spacing, you can indent lines however you want !
!==============================================================================!
write(*,*) 'Hello World'            
    WRITE(*,*) 'Here I come Fortran'
!==============================================================================!
!                 We started the program, and we must end it.                  !
!             We start and end the program calling its same name.              !
!              You must end your programs or they will not work.               !
!==============================================================================!
end program Hello_World                   
