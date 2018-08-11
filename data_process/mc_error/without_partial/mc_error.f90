!=============================================================================80
!                 Standard Deviation of Monte_Carlo
!=============================================================================80
!       Discussion: 
! Fortran 90 implementation for computing vertical error bars as a function of 
! iteration (for monte carlo simulations). 
! The user provides columns of data (as a function of iteration) and an error
! is computed indepedently for each column. 
!==============================================================================!
!       Modified:
! 9 August 2018
!       Authors:
! Shane Flynn
!==============================================================================!
Program mc_error
implicit none
!==============================================================================!
!==============================================================================!
!               Discussion:
! data_in       	==> Input data file
! data_out	        ==> Output data file
! Npoints               ==> Number of data points (in each column) 
! Ncol  	        ==> Number of columns of data (error analysis for each)
! skip      	        ==> Number of initial points to skip
! mc_data(Npoints,Ncol) ==> data from data_in
! orig_avg(1,Ncol)      ==> Average of data 
! std_dev(1,Ncol)	==> The Standard Deviation (The Error Bar)
!==============================================================================!
character(len=50) :: data_in,data_out
integer :: Npoints,Ncol,skip,i
double precision,allocatable :: mc_data(:,:),variance(:,:)
double precision,allocatable:: std_dev(:,:),orig_avg(:,:)
!==============================================================================!
!			    Read Input Data File
!==============================================================================!
read(*,*)data_in
read(*,*)data_out
read(*,*)Npoints
read(*,*)Ncol
read(*,*)skip
allocate(mc_data(Npoints,Ncol),orig_avg(1,Ncol),std_dev(1,Ncol))
mc_data=0d0
orig_avg=0d0
std_dev=0d0
write(*,*)'Number of Data Points ==> ',Npoints
write(*,*)'Columns of Data ==> ',Ncol
write(*,*)'User Defined Skip ==> ',skip
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
allocate(variance((Npoints-skip),Ncol))
variance=0d0
!==============================================================================!
!                           Compute Average of Data 
!==============================================================================!
do i=(1+skip),Npoints
  orig_avg(1,:)=orig_avg(1,:)+mc_data(i,:)
enddo
orig_avg(1,:)=orig_avg(1,:)/(Npoints-skip)
write(*,*)'original average ==> ',orig_avg
!==============================================================================!
!                          Compute Error Bar 
!==============================================================================!
do i=(1+skip),Npoints
    variance(i-skip,:)=(mc_data(i,:)-orig_avg(1,:))**2
    std_dev(1,:)=std_dev(1,:)+variance(i-skip,:)
enddo
std_dev=sqrt(std_dev/((Npoints-skip-1)*(Npoints-skip)))
write(*,*)'Standard Deviation ==> ',std_dev
!==============================================================================!
!                   Final Iteration and Error to File 
!==============================================================================!
open(14,file=data_out)
write(14,*)mc_data(Npoints,:),std_dev(1,:)
close(14)
write(*,*)'Final Check Successful; Hello Universe!'
End Program mc_error
