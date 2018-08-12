#!/usr/bin/env python
#=============================================================================80
#                       Basic Python Plot
#=============================================================================80
#       Discussion: 
# Python 2 implementation for plotting (scatter) basic x,y data from a file. 
# The code requires the pandas python module which may not pre-installed. 
# The first line of code makes the script executable, can be executed anywhere
# if this script is placed in your bin directory (or somewhere in PATH).
#==============================================================================#
#       Modified:
# 11 August 2018
#       Author:
# Shane Flynn
#==============================================================================#
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sys import argv
#==============================================================================#
#       Discussion:
# script        ==> The name of THIS script (plot.py)
# data_file     ==> The name of the data file you wish to plot
# xaxis         ==> The x-axis label
# yaxis         ==> The y-axis label
# output        ==> The file name for the generated figure
# df_data       ==> The x,y data read in from data_file
#==============================================================================#
#                             Populate argv
# To run the script on terminal you must provide all of the elements of argv
#       Example
#   $ plot.py data_in.dat 'xname' 'yname' myfig.png
#==============================================================================#
script, data_file, xaxis, yaxis, output = argv
#==============================================================================#
#                           Read in Data
# Assumes file only contains x,y data, no header, delimeter=space
#==============================================================================#
df_data = pd.read_csv(data_file, delim_whitespace=True, header=None, dtype=np.float64)
#==============================================================================#
#                         Generate Scatter Plot
#==============================================================================#
plt.scatter(df_data[0],df_data[1])
plt.xlabel('%s' %xaxis)
plt.ylabel('%s' %yaxis)
plt.legend()
plt.savefig('%s' %output)
#plt.show()
