#=============================================================================80
#                  Gaussian Elimination of Non-Singular Matricies              #
#==============================================================================#
#    Discussion: Python 2 Implementation of Gaussian Elimination.
#       The code takes a square matrix and transforms it into a diagonal matrix 
#       using basic row operations. 
#       The code requires your first matrix to be square, and non-singular.
#       The second matrix must have the same number of rows as matrix 1, but not
#       necessairly square (any number of columns). 
#       If the second matrix is a column vector, than the first matrix will be 
#       interpreted as a system of equations, Ax = b, and it will solve for the 
#       x vector.
#       Finally the inverse of the first matrix is computed.
#==============================================================================#
#       We assume that the matrix is non-singular and has no accidental 0s 
#       If these occur in your matrix all bets are off!!!
#==============================================================================#
#    Modified:
#       17 May 2018
#    Author:
#       Shane Flynn
#==============================================================================#
#		 	   Additional Python Packages
#==============================================================================#
#    numpy  ==> Python Scientific Computing Package
#    pandas ==> Python Package for Data Structures and Data Analysis
#               https://pandas.pydata.org
#    argv   ==> The argument Variable in Python
#==============================================================================#
from sys import argv
import pandas as pd                     
import numpy as np
#==============================================================================#
#                    Call Python to Read In Data Files
#       To run on terminal type ==> python script_name matrix1 matrix2
#==============================================================================#
script, input_matrix, input_matrix2 = argv
#==============================================================================#
#               Read Input Data Files Into Matricies 
#   Assumes matrix is written with elements seperated by spaces, and rows 
#   seperated by a new line.
#==============================================================================#
df_matrix = pd.read_csv(input_matrix, delim_whitespace=True,header=None, dtype=np.float64)
df_matrix2 = pd.read_csv(input_matrix2, delim_whitespace=True,header=None, dtype=np.float64)
mat_dim= len(df_matrix.columns)
mat_dim2= len(df_matrix2.columns)
print 'Your first matrix should be square with dimensions %i by %i' %(mat_dim, mat_dim)
print 'here are the first few rows/columns of your first matrix'
print df_matrix.head()
print 'Your second matrix should be %i rows by %i columns' % (mat_dim, mat_dim2)
print 'here are the first few rows/columns of your second matrix'
print df_matrix2.head()
#==============================================================================#
#       Generate Identity Matrix for Computing the Inverse of Matrix 1
#==============================================================================#
identity = []
for i in range(0, mat_dim):
    for j in range(0, mat_dim):
        if i == j:
            identity.append(1)
        else:
            identity.append(0)
df_identity = pd.DataFrame(np.array(identity).reshape(mat_dim,mat_dim), dtype=np.float64)
#==============================================================================#
#                       Perform Gaussian Elimination
#   We convert Matrix 1 into an upper diagonal matrix.
# i     ==> loops over entire matrix size (it is square)
# j     ==> starts below the diagonal and loops to the end of the column
# k     ==> loops over the elements within the same row for Matrix 1 (N by N)
# m     ==> applies the transformations to the identity matrix, for computing 
#           the inverse matrix.
# l     ==> loops over the elements within the same row for Matrix 2 (N by M)
# scale ==> value (float) used for row reduction at each iteration. 
#==============================================================================#
scale_vec = []
for i in range(0, mat_dim-1):
    for j in range(i+1, mat_dim):
        scale = -1*df_matrix[i][j] / df_matrix[i][i]
        scale_vec.append(scale)
        for k in range(i, mat_dim):
            df_matrix[k][j] = df_matrix[k][j]+ scale*df_matrix[k][i]
        for m in range(0, mat_dim):
            df_identity[m][j] = df_identity[m][j]+ scale*df_identity[m][i]
        for l in range(0, mat_dim2):
            df_matrix2[l][j] = df_matrix2[l][j]+ scale*df_matrix2[l][i]
print 'The First Matrix is now Upper Triangular'
print df_matrix
print 'The Second Matrix has been scaled accordingly'
print df_matrix2
print'Here are the scaling operations'
print(scale_vec)
print'The identity matrix is becoming your inverse matrix!'
print df_identity
#==============================================================================#
#           Compute Determinant From Gaussian Reduced Matrix
#   The Determinant is given by the product of the diagonal elements if the 
#   matrix has been reduced to upper-triangular.
#==============================================================================#
deter = 1
for i in range(0,mat_dim):
    deter = deter*df_matrix[i][i]
print 'The determinant of the first matrix is', deter
#==============================================================================#
#                   Solve Linear System of Equations
# If matrix 2 is a column vector, assume we are solving a system of Linear 
# Equations Ax=b (matrix 1 x = matrix 2) and solve for x
# x_i = ( b(i) - sum[a_{ij} * x_j] ) / A_ii)
#==============================================================================#
if mat_dim2 == 1:
    print 'We will Solve the Linear System of Equations'
    x_vec = []
    for i in range(0, mat_dim):
            x_vec.append(0.)
    df_xvec = pd.DataFrame(np.array(x_vec).reshape(mat_dim))
#==============================================================================#
# Matrix 1 is square, upper-triangle. Therefore the last element of x is already
# known and does not need to be evaluated. 
#==============================================================================#
    df_xvec.loc[mat_dim-1, 0] = df_matrix2[0][mat_dim-1] / df_matrix[mat_dim-1][mat_dim-1]
#==============================================================================#
# Loop over the second to last row, until the first row
# Loop from the element passed the diagonal to the last element in the row
#==============================================================================#
    for i in range(mat_dim-2, -1, -1):
        for j in range(i+1, mat_dim, 1):
            summy = df_matrix[j][i]*df_xvec[0][j]
            df_matrix2[0][i] = df_matrix2[0][i]-summy
        df_xvec[0][i] = df_matrix2[0][i] / df_matrix[i][i]
    print 'Here is the solution to the linear system'
    print(df_xvec)
#==============================================================================#
else:
    print 'Skipping Linear System Solution, matrix 2 is not a column Vector'
#==============================================================================#
#                       Perform Gaussian Elimination
#   This time we convert our upper triangular matrix into a diagonal matrix
# i     ==> loops over entire matrix size (it is square)
# j     ==> starts above the diagonal and loops to the beginning of the column
# k     ==> loops over the elements within the same row for Matrix 1 (N by N)
# m     ==> applies the transformations to the identity matrix, for computing 
#           the inverse matrix.
# scale ==> value (float) used for row reduction at each iteration. 
#==============================================================================#
scale_vec2 = []
for i in range(mat_dim-1, -1, -1):
    for j in range(i-1, -1, -1):
        scale = -1*df_matrix[i][j] / df_matrix[i][i]
        scale_vec2.append(scale)
        for k in range(i, mat_dim):
            df_matrix[k][j] = df_matrix[k][j]+ scale*df_matrix[k][i]
        for m in range(0,mat_dim):
            df_identity[m][j] = df_identity[m][j]+ scale*df_identity[m][i]
print 'The second round of scaling is given by'
print scale_vec2
print 'Matrix 1 is now diagonal'
print df_matrix
#==============================================================================#
# Convert Matrix 1 into an Identity Matrix, and Find Our Inverse
#==============================================================================#
for i in range(0, mat_dim):
    divider = df_matrix[i][i]
    df_matrix[i][i] = df_matrix[i][i] / df_matrix[i][i]
    for j in range(0,mat_dim):
        df_identity[j][i] = df_identity[j][i] / divider
print 'The Inverse Matrix Is Given by'
print df_identity
