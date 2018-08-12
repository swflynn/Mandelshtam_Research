PROGRAM unif_sobol_points
      USE  sobol
      IMPLICIT NONE

      INTEGER (kind=8) :: m, n, skip
      Double Precision, allocatable :: r(:,:), q(:,:)
      REAL :: end_val, start_val, int_range, integral
      INTEGER :: i
      REAL*8 :: f
!===============================Paramaters to be set===================================!
!=============m: spatial dimension, n: Sobol Points, skip: point seed==================!
!==============================val: integral bounds====================================!
!======================================================================================!
      m = 1                                         
      n = 100                                      
      skip = 100                                  
      end_val = 10.0                             
      start_val = 0.0
      int_range = end_val - start_val           
      write(*,*) 'Check 1 Success; Set Parameters'
!======================================================================================!
!================================initialize integral===================================!
!======================================================================================!
      f = 0.0D0                                
      integral = 0.0
      ALLOCATE (r(m,n))       
      ALLOCATE (q(m,n))       
      write(*,*) 'Check 2 Success; Define Arrays'
!======================================================================================!
!==================================Generate points=====================================!
!======================================================================================!
      CALL i8_sobol_generate(m, n, skip, r) 
      write(*,*) 'Check 3 Success; Generate Sobol Points for MC Integration'
!======================================================================================!
!=====================sobol points: [0,1] need to sample fn domain=====================!
!======================================================================================!
      q = r*int_range    
      DO i=1,n
          f = f+integrand(q(m,i))
      END DO
      write(*,*) 'Check 4 Success; Evaluate Sobol Points'
!======================================================================================!
!=============================Normalize MC Integration=================================!
!======================================================================================!
      f = f/n
      integral = (end_val-start_val)*f
      WRITE(*,*) 'The Numerical Integral Yields: '
      WRITE(*,*) integral
      write(*,*) 'Check 5 Success; Hello Universe!'
!======================================================================================!
!===============================Function to Integrate==================================!
!======================================================================================!
CONTAINS

      FUNCTION integrand(r) RESULT (values)
        IMPLICIT NONE
        DOUBLE PRECISION :: r
        REAL :: values
        values = (r**2)*EXP(-r)
      END FUNCTION integrand

END PROGRAM unif_sobol_points
