import scipy.io as si
import sys
import csv

mat_file = sys.argv[1]
csv_file = mat_file.replace('mat', 'csv')

with open (csv_file, 'w') as f:
    csv.writer(f).writerows(si.loadmat(mat_file).items())
