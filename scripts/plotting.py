#!/usr/bin/env python
#=============================================================================80
#			    Set Python Path
# Make a write-up for making a scripts folder and add it to path
#=============================================================================80
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sys import argv

script, data_file = argv

df_data = pd.read_csv(data_file, delim_whitespace=True, header=None, dtype=np.float64)

print 'here is the first few rows of the datafile'
print df_data.head()

x = df_data[0]
y = df_data[1]

#==============================================================================#
#           Take the axis titles as argv arguments
#==============================================================================#

plt.scatter(x,y)
plt.xlabel('X-Axis Title')
plt.ylabel('Y-Axis Title')
plt.savefig('plot_name.png')
plt.close()
