# Pandas to read in a data file and plot the columns

import pandas as pd                     # useful for tables of data
import numpy as np                      # useful for math
import matplotlib.pyplot as plt         # plotting

#=====================================================================================#
# Use Pandas to read in our data file [pd.read_csv()] to a dataframe
# Our data file seperates matrix elements with white space as the delimeter (not a comma)
# Our data has no header (i.e we did not name the columns)
# How you read in the data will change based on your data set, google pd.read_csv()
#=====================================================================================#
df_conv = pd.read_csv('converge.dat', delim_whitespace=True,header=None)

#=====================================================================================#
# You should check to make sure the data was read in correctly.
# We can print the first 5 rows using the head command, the last 5 with tail.
#=====================================================================================#
print 'here are the first 5 rows'
print df_conv.head()
print 'here are the last 5 rows'
print df_conv.tail()

#=====================================================================================#
# A dataframe is similar to a list within a list, so we can use the same indexing.
# If you want to see the first column of data we use square brackets (indexing from 0)
#=====================================================================================#
print 'here is the first column'
print df_conv[0]

#=====================================================================================#
# If you want to see the first element of the first column than you would do 
#=====================================================================================#
print 'here is the first element of the first column'
print df_conv[0][0]

#=====================================================================================#
# If you want to see 2 columns (XY data), we do a list within a list for syntax
#=====================================================================================#
print 'Here are the first and third columns of data'
print df_conv[[0,2]]

#=====================================================================================#
#=====================================================================================#
# Now the we know how to operate a dataframe let's start using them. 
# We are interested in seeing how each element of the matrix converges
# Diagonal elements converge to 1, off-diagonal to 0
#=====================================================================================#
#=====================================================================================#

# Iteration number is the first element of every row (first column = indepedent variable)
x = df_conv[0]

#=====================================================================================#
# If we want to make an x-y plot we can define variables and make a standard graph
# Note: Pandas does have its own plotting functions, but I am going to use matplotlib
# People are probably familiar with matplotlib, feel free to look into [pd.DataFrame.plot()]
#=====================================================================================#
x2 = df_conv[2]
plt.plot(x,x2)
plt.xlabel('Number of Iterations')
plt.ylabel('Matrix Element Value')
plt.savefig('testfig.png')
plt.close()

#=====================================================================================#
# This is alot of data, let's look at all the diagonal elements on 1 graph
# We know the structure of our data file, the diagonal occurs every 11 elements
# So we could just hard-code in the elements we want into a list
#=====================================================================================#
diag_elems = [1,12,23,34,45,56,67,78,89,100]
for i in diag_elems:
    plt.plot(x,df_conv[i], label='%s'%i) 

plt.xlabel('Nsobol')
plt.ylabel('Matrix Element Value')
plt.legend(bbox_to_anchor=(1.05, 1), loc=2, borderaxespad=0.) #legend outside figure
plt.savefig('diag_conv_E7.png', bbox_inches='tight') # save legend if cutoff 
plt.close()

# Notice we loop over the indices to make our graph
# Each plot occurs within the loop, therefore we will get 1 graph with 10 data-sets
# The legend will have 10 trends, so I played around with formatting
# There are various ways to do this, I wrote the legend outside
# If you just show the graph the legend may be cutoff, saving gives you more space
# Finally; give your names meaning, we will see why below

#=====================================================================================#
# Let's now plot the absolute error of each diagonal element (we are interested in convergence)
# We know the diagonal elements should be 1 
# One way to do this is simply during the plotting process
#=====================================================================================#
for j in diag_elems:
    plt.plot(x,abs(1-df_conv[j]), label='%s'%j)

plt.xlabel('Nsobol')
plt.ylabel('Matrix Element Absolute Error')
plt.legend(bbox_to_anchor=(1.05, 1), loc=2, borderaxespad=0.) 
plt.savefig('diag_conv_abs_E7.png', bbox_inches='tight')
plt.close()

#=====================================================================================#
# Finally, let's go ahead and just plot all of the matrix elements to their own file.
# Most of the elements should be 0, so I will just get absolute value for convergence
# This is a-lot of graphs (100 for this data set)
# There is no way you would want to do this by hand, or by clicking in excel
# Again we know how many columns there are so we can hard code a while loop
# You could also do this more generally (length command maybe?, Try it out!)
#=====================================================================================#
k = 1
while k < 101:
    plt.plot(x,abs(df_conv[k]))
    plt.xlabel('Nsobol')
    plt.ylabel('Matrix Element Value')
    plt.savefig('1D_s_conv_abs_E9_%s.png'%k) 
    plt.close()
    k = k+1
# Notice we loop over the indices to make our graph
# We save the files with their index name so we don't need a legend and etc.
# Each plot occurs within the loop and we close the figure with that iteration
# This means we will generate a new figure each iteration
# Notice this entire code will generate a ton of data, in seconds!
# Enjoy! -Shane (6-30-17)
