#!/usr/bin/env python

# This python script computes the common Rosetta Score-vs-RMSD plot and is intended for the integration into the CyVerse Discovery Environment

import sys
import os
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

# import data for score-vs-rsmd scatter plot and store it in an array
filename="score-vs-rmsd.dat"
data=[]
data=np.genfromtxt(filename, delimiter='', unpack=True)
rmsd=data[0]
score=data[1]

# set up axis and title
plt.figure(figsize=(5, 3), dpi=300)
ax=plt.axes()
ax.xaxis.set_major_locator(ticker.MultipleLocator(1))
ax.yaxis.set_major_locator(ticker.MultipleLocator(10))
plt.title("Score-vs-RMSD")
plt.xlabel("RMSD [$\AA$]")
plt.ylabel("Score [REU]")

# Compute plot and safe it into a .png image
plt.scatter(score, rmsd, marker=".", s=10, color='blue', linewidth=1)
plt.savefig('Score-vs-RMSD.png', bbox_inches = "tight")
