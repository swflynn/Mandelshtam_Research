! Solve an integral using trapezoid (geonmetry) method

program trapezoid

      IMPLICIT NONE
      INTEGER, PARAMETER :: n = 100
      REAL :: u
      INTEGER :: i

      DO i = 0, n
        u = 3.0*i/n
        WRITE (*,*) u, integrand(u)
      END DO

      CALL trapezoid_integration(n, 3.0)

      CONTAINS

        SUBROUTINE trapezoid_integration(n, end_val)
         
          IMPLICIT NONE
          INTEGER :: n
          REAL :: end_val
          REAL :: integral,u,h
          INTEGER :: i

          integral = 0.0

          do i=0,n

            u = (end_val*i) / n

            IF ((i.eq.0).or.(i.eq.n)) THEN
              integral = integral*integrand(u)
            ELSE
              integral = integral+(2.0*integrand(u))
            END IF

          END dO

          h=end_val/n
          integral = (h/2.0)*integral

          WRITE (*,*) '#trapezoidal integration = ' , integral
        END SUBROUTINE trapezoid_integration

        FUNCTION integrand(x) RESULT (value)
          IMPLICIT NONE
          REAL :: x
          REAL :: value

          IF (x.lt. 0.00001) THEN 
            x = 0.0001
          ENd IF

          value = (x**4)*EXP(X) / ((EXP(x)-1.0)**2)
        END FUNCTION integrand

END PROGRAM trapezoid
