
import sys
import os
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

# Import fragment quality data and store it in an array
filename="frag_qual.dat"
data=[]
data=np.genfromtxt(filename, delimiter='', unpack=True)
sequence=data[1]
rmsd=data[3]

# Set up plot dimensions, axis and title 
plt.figure(figsize=(5, 3), dpi=600) 
plt.tight_layout()
ax=plt.axes()
ax.xaxis.set_major_locator(ticker.MultipleLocator(10))
ax.yaxis.set_major_locator(ticker.MultipleLocator(0.5))
plt.title("Fragment qualities")
plt.ylabel("RMSD [$\AA$]")
plt.xlabel("Sequence [1]")

# Compute plot and save it into a .png image
plt.scatter(sequence, rmsd, marker="_", s=10, color='C3', linewidth=1)
plt.savefig('Fragment-qualities.png', bbox_inches = "tight" )
