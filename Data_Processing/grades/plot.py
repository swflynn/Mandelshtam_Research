#=============================================================================80
#                        Histogram Exam Scores from CSV
#=============================================================================80
#       Discussion: 
# Python 2 implementation for plotting csv exam scores
#==============================================================================#
#       Modified:
# 25 October 2018
#       Author:
# Shane Flynn
#==============================================================================#
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sys import argv
#==============================================================================#
#       Discussion:
# script        ==> This Script (plot.py)
# data_file     ==> Data file to plot
# xaxis         ==> X-axis label
# yaxis         ==> Y-axis label
# df_data       ==> dataframe from data_file
#==============================================================================#
#                             Populate argv
#==============================================================================#
script, data_file, xaxis, yaxis = argv
#==============================================================================#
#                           Read in Data
#==============================================================================#
df_data = pd.read_csv(data_file, header=None, dtype=np.float64)
#==============================================================================#
#                       Generate Histograms For Each Question
# assumes data is of the form ==> 	x1,x2,x3,...,xn
#==============================================================================#
cols = len(df_data.columns)
for i in range(1,cols-1):
    plt.hist(df_data[i], bins='auto')
    plt.xlabel('%s' %xaxis)
    plt.ylabel('%s' %yaxis)
    plt.show()
