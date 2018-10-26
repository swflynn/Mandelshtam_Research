#=============================================================================80
#                               Python Grades
#=============================================================================80
#       Discussion: 
# Python 2 implementation for storing student grades
# Pass in the student ID and scores for each problem
# write results and final grade to file with ID name (csv seperated for eee)
#==============================================================================#
#       Modified:
# 25 August 2018
#       Author:
# Shane Flynn
#==============================================================================#
from sys import argv
#==============================================================================#
#       Discussion:
# script        ==> The name of this script (grades.py)
# ID            ==> Student ID Number (read by ee to import csv file)
# final         ==> Final grade 
#==============================================================================#
#                             Populate argv
#==============================================================================#
script, ID, P1, P2, P3, P4, P5, P6, P7 = argv
#==============================================================================#
# Compute Final Grade
#==============================================================================#
final = float(P1) + float(P2) + float(P3) + float(P4) + float(P5) + float(P6) + float(P7)
print final
#==============================================================================#
# Write Scores to csv file (f=ID.csv)
#==============================================================================#
f = open('%s.csv' % ID, 'wb')
f.write('%s,' %str(ID))
f.write('%s,' %str(P1))
f.write('%s,' %str(P2))
f.write('%s,' %str(P3))
f.write('%s,' %str(P4))
f.write('%s,' %str(P5))
f.write('%s,' %str(P6))
f.write('%s,' %str(P7))
f.write('%s,' %str(final))
f.close()
