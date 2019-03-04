# Matrix Convergence Analysis Using Pandas:
If you have any type of data that is sorted by rows and columns, than a dataframe can make your life much easier!

## Running This Program:
Before we get started we will need to download the Python package Pandas.
This package is for making dataframes, which are useful for analyzing data, as we will see. 

The easiest way to do download pandas is using the software pip
(Note: I am doing all of this on a mac terminal, this may not work in windows).

### pip for Python:
pip is the Python package manager, it is used for installing and un-installing extra Python packages. 
If you have Python, you will probably already have pip installed.
To check, go to terminal and type `$ which pip` or try `pip --version`.
If you get a message telling you where pip is or what version you have, then you already have pip.
If you do not have pip you will get a message that says `pip command not found`

#### If You DO NOT Have pip:
If you don't have pip, we can use a differest software to download it.  
The software we will use is called `easy_install` and is installed on most-all apple computers. 
On the command line type the following `$ sudo easy_install pip`
After doing this, if everything worked, you should be able to type `which pip` on terminal and get a location.

If this is new to you, this command tells easy_install to go find pip on the internet and install it. 
Sudo essentially tells your computer to do whatever you type (you may need to enter your password for logging onto the computer). 

If this method doesn't work, you will have to find your own way to install pip, or pandas (ask google, or a friend for help). 

### pip to install pandas:
Once you are certain you have pip, go to your terminal and type `$ pip install pandas`
This will download pandas if you do not already have it (once you download it you will never have to do it again, unlesss you remove it manually).

## Pandas and DataFrames:
If you have ever used a spreadsheet you understand how convenient they can be for handling data.
Pandas is a Python package that will let you work with data in a format similar to a spreadsheet, known as a DataFrame.
One problem with using excel is speed, if you have a large dataset it will take excel a very long time to do any manipulation of the data. 
Pandas will allow us to use a similar format to the data, with the power and efficiency of Python. 

To prove this point, my example contains a matrix with ~100 columns and ~100 rows.
YOU HAVE BEEN WARNED: this is a large dataset (to some people), and should prove how useful Python and Pandas can be.
For reference the code takes about 30 seconds to complete, during which time it will generate over 100 graphs. 

## Purpose of this Code:
Attached you will find the converge.dat data file I am going to analyze with the mat_conv.py Python code. 
First the code will read in the datafile to a pandas dataframe.
Next it will print out some of the columns, to show you how indexing works in pandas. 
Then it will plot the diagonal elements of the matrix on 1 graph (there will be 10 datasets plotted). 
Finally it will plot the convergence of each matrix element to a seperate graph (WARNING THIS WILL MAKE 100 GRAPHS, so be sure you run this code in an empty directory).

The data file contains 100 rows, and ~ 100 columns.
The first column contains what iteration you are on (indepedent variable).
Each of the remaining columns contain a matrix element, each column is seperated by white space.
If you look at the datafile, you will see their is no header (names of columns), only data. 

## What the Data Represents:
You DO NOT need to read/understand this section to work with the code, it is for curiosity only. 
If you are interested the data file comes from a Fortran program to calculate the matrix elements of a Harmonic Oscilator Wavefunction weighted by a Gaussian in 1 spacial dimension. 
Therefore each element of the matrix corresponds to an integral of the form <HO | e^{-(x^2)/2} | HO>.
By construction the diagonal elements of the matrix should converge to 1, and the off-diagonal elements should converge to 0 (linear indepedence of the basis, no PE). 
