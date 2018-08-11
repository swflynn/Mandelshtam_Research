!=============================================================================80
!                 Standard Deviation of Monte_Carlo
!=============================================================================80
!       Discussion: 
! Fortran 90 implementation for computing vertical error bars as a function of 
! iteration (for monte carlo simulations). 
! The user provides columns of data (as a function of iteration) and an error
! is computed indepedently for each column. 
! The code assumes a large amount of data and computes a partial averaging over
! the provided data. 
!==============================================================================!
!       Modified:
! 9 August 2018
!       Authors:
! Moises Romero and Shane Flynn
!==============================================================================!
Program mc_error_p
implicit none
!==============================================================================!
!==============================================================================!
!               Discussion:
! data_in       	==> Input data file
! data_out	        ==> Output data file
! Npoints               ==> Number of data points (in each column) 
! Ncol  	        ==> Number of columns of data (error analysis for each)
! skip      	        ==> Number of initial points to skip
! freq		        ==> Frequency to take partial average with
! p_avg_size            ==> Number of points after partial average
! adjust                ==> Factor to evenly divide partial average
! mc_data(Npoints,Ncol) ==> data from data_in
! orig_avg(1,Ncol)      ==> Average of data before partial averaging
! p_avg(p_avg_size,Ncol)==> partially averaged data
! std_dev(1,Ncol)	==> The standard deviation (The Error Bar)
!==============================================================================!
character(50) :: data_in,data_out
integer :: Npoints,Ncol,skip,freq,p_avg_size,adjust,counter,counter2,i
double precision,allocatable :: mc_data(:,:),p_avg(:,:),variance(:,:)
double precision,allocatable:: std_dev(:,:),avg(:,:),orig_avg(:,:)
!==============================================================================!
!			    Read Input Data File
!==============================================================================!
read(*,*)data_in
read(*,*)data_out
read(*,*)Npoints
read(*,*)Ncol
read(*,*)skip
read(*,*)freq
allocate(mc_data(Npoints,Ncol),orig_avg(1,Ncol),avg(1,Ncol),std_dev(1,Ncol))
write(*,*)'Number of Data Points ==> ',Npoints
write(*,*)'Columns of Data ==> ',Ncol
write(*,*)'User Defined Skip ==> ',skip
write(*,*)'User Defined Partial Frequency ==> ',freq
write(*,*)'Check 1 Success; Read Input File'
!==============================================================================!
!			  Read In Data for Analysis 
!==============================================================================!
open(13,file=data_in)
do i=1,Npoints
    read(13,*)mc_data(i,:)
enddo
close(13)
write(*,*)'Check 2 Sucess; Read in Data'
!==============================================================================!
!                    Compute Partial Average Parameters
!==============================================================================!
adjust = mod((Npoints-skip),freq)
p_avg_size = (Npoints-skip-adjust )/freq
write(*,*)'Adjust parameter ==> ',adjust
write(*,*)'Number of Points for Partial Average ==> ',p_avg_size
allocate(p_avg(p_avg_size,Ncol),variance(p_avg_size,Ncol))
write(*,*) 'Check 3 Success; Set parameters for Partial Average'
!==============================================================================!
!                               Initialize 
!==============================================================================!
avg(:,:)=0d0
counter=0
counter2=0
orig_avg = 0d0
p_avg=0d0
!==============================================================================!
!               Compute Average of Data before Partial Averaging 
!==============================================================================!
do i=(1+skip+adjust),Npoints
  orig_avg(1,:)=orig_avg(1,:)+mc_data(i,:)
enddo
orig_avg(1,:)=orig_avg(1,:)/(Npoints-(skip+adjust))
write(*,*)'original average ==> ',orig_avg
!==============================================================================!
!                           Partial Average Data
!==============================================================================!
do i=(1+skip+adjust),Npoints
    avg(1,:)=avg(1,:)+mc_data(i,:)
    counter=counter+1
    if(mod(counter,freq)==0)then
        avg(1,:)=avg(1,:)/freq
        counter2=counter2+1
        p_avg(counter2,:)=avg(1,:)
        avg = 0d0
        counter = 0d0
    endif
enddo
write(*,*)'Check 4 Success; Computed Partial Average'
!==============================================================================!
!                          Compute Error Bar 
!==============================================================================!
do i=1,p_avg_size
    variance(i,:)=(p_avg(i,:)-orig_avg(1,:))**2
    std_dev(1,:)=std_dev(1,:)+variance(i,:)
enddo
std_dev=sqrt(std_dev/((p_avg_size-1)*(p_avg_size)))
write(*,*)'Standard Deviation ==> ',std_dev
!==============================================================================!
!                   Final Iteration and Error to File 
!==============================================================================!
open(14,file=data_out)
    write(14,*)mc_data(Npoints,:),std_dev(1,:)
close(14)
write(*,*)'Final Check Successful; Hello Universe!'
End Program mc_error_p
