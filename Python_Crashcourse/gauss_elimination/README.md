# Gaussian Elimination Using Pandas:
A simple program to perform Gaussian Elimination on a matrix with Python 2. 

## Running This Program:
To run this program you will need the [Pandas](https://pandas.pydata.org/) Package for Python 2. 
If you have never heard of Pandas check out this [page](https://github.com/swflynn/python_tutorials/tree/master/python_examples/matrix_pandas.py). 

To run this code on command line use the following  
python script_name matrix1 matrix2  
For example try running  
$ python gaus.py matrix.dat vec.dat

## Purpose of the Code:
The program allows the user to supply two matricies, the first must be a square matrix (N by N) the second must have the same number of rows (N by M). 
The first matrix is converted into an upper triangular matrix, its determinate is computed and finally its inverse. 
If the second matrix is a column vector, than the program will assume the first matrix represents a system of equations, and the solutions to the system will be computed. 
