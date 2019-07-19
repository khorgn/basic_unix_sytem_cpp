#!/usr/bin/env python3

#pylint: disable=C0103, C0111, W0105, C0301, C0326
#pylint: disable=W0611, C0411

# sudo apt install python3-pip
# sudo apt install pylint3
# pip3 install scikit-learn pandas numpy scipy matplotlib seaborn statsmodel tensorflow keras

import pandas as pad # data handling
import numpy as np # mathematic constructs
import scipy as scp # scientific constructs
import matplotlib as mpl # 2D ploting library
import seaborn as sbn # extension to give higher-level interface
import sklearn as skl # scikit-learn machine learning algorithms, more made for model-selection and prediction for non-train samples
import statsmodels as stm # explore data and estimate statistical models, more made to check the quality of the fitting and understanding the relevant variables and effect size

# import keras as krs # neural network
# import tensorflow as tsf # tensor handling

import math # standard module for math functions
import cmath # standard module for complex number math function
import itertools # module to use more complexes iterators




print("hello world!")

compNum = 1+1j # a complex number, in python base

polarCoordinates = cmath.polar(compNum) # (modulus, phase (angle))
rectCoordinates = cmath.rect(polarCoordinates[0], polarCoordinates[1])

print(np.isclose(compNum, rectCoordinates))

for (i, j, k) in itertools.product(range(3), range(4), range(5)): # from (0, 0, 0) to (2, 3, 4)
    print("itertools.product(range(3), range(4), range(5): i={}, j={}, k={}".format(i, j, k))
for (i, j, k) in itertools.product(range(3), repeat=3): # from (0, 0, 0) to (2, 2, 2)
    print("itertools.product(range(3), repeat=3): i={}, j={}, k={}".format(i, j, k))
for (i, j, k) in np.ndindex((3, 2, 4)): # from (0, 0, 0) to (2, 1, 3)
    print("np.ndindex((3, 2, 4): i={}, j={}, k={}".format(i, j, k))

# in C++14, std::complex<double> z = 1. + 1i

# https://engineering.ucsb.edu/~shell/che210d/numpy.pdf
# https://www.springboard.com/blog/data-mining-python-tutorial/
# https://www.datacamp.com/community/tutorials/seaborn-python-tutorial
# https://www.datacamp.com/community/tutorials/r-or-python-for-data-analysis

# donjayamanne.python-extension-pack
