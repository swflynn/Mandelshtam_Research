!====================================================================!
!======================OpenMP Hello Universe=========================!
!====================================================================!
! Fortran 90 Program for running hello world using OpenMP
! Program genertes a parallel region with OpenMP
! Inside the region each thread prints its thread id and hello world 
! The master thread prints out the total number of threads
!====================================================================!
!=====================Variables=====================================!
!====================================================================!
! NTHREADS: The total number of threads available
!====================================================================!
! TID: The individual thread ID
!====================================================================!
!=====================Runtime Library Routines ======================!
! You can think of these as intrinsic functions for OpenMP
!====================================================================!
! OMP_GET_NUM_THREADS: Returns number of threads in current team
! Needs to be given the data type of integer
!====================================================================!
! OMP_GET_THREAD_NUM: Returns the number of the calling thread 
! Needs to be given the data type of integer
!====================================================================!
! A useful document with a collection of OpenMP functionality:
! http://www.openmp.org/wp-content/uploads/OpenMP-4.0-Fortran.pdf
!====================================================================!
!======================OpenMP Hello Universe=========================!
!====================================================================!
PROGRAM hello_thread
IMPLICIT NONE 
INTEGER :: NTHREADS, TID
INTEGER :: OMP_GET_NUM_THREADS, OMP_GET_THREAD_NUM    
!====================================================================!
!===================Create Parallel Region===========================!
!====================================================================!
!$OMP PARALLEL PRIVATE(NTHREADS, TID)
      TID = OMP_GET_THREAD_NUM()
      WRITE(*,*) 'Hello Universe from thread = ', TID

      IF (TID .EQ. 0) THEN
        NTHREADS = OMP_GET_NUM_THREADS()
        WRITE(*,*) 'Number of threads = ', NTHREADS
      END IF
!$OMP END PARALLEL
!====================================================================!
!===================Destroy Parallel Region==========================!
!====================================================================!
END PROGRAM hello_thread
