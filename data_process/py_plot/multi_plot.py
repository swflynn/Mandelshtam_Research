#!/usr/bin/env python
#=============================================================================80
#                       Python Plot Multiple Data Sets
#=============================================================================80
#       Discussion: 
# Python 2 implementation for plotting (scatter) x,y1,y2,.. data sets
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
#==============================================================================#
script, data_file, xaxis, yaxis, output = argv
#==============================================================================#
#                           Read in Data
#==============================================================================#
df_data = pd.read_csv(data_file, delim_whitespace=True, header=None, dtype=np.float64)
#==============================================================================#
#                         Generate Scatter Plot
# assumes data is of the form ==> 	x	y1	y2	....
# plots each column against x on the same graph
#==============================================================================#
cols = len(df_data.columns)
x=df_data[0]
for i in range(1,cols):
    plt.scatter(x,df_data[i], label='%s'%i)
plt.xlabel('%s' %xaxis)
plt.ylabel('%s' %yaxis)
plt.legend()
plt.savefig('%s' %output)
