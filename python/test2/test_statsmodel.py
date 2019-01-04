#!/bin/env python3

#pylint: disable=C0103, C0111, W0105, C0301, C0326

import statsmodels.api as sm
import statsmodels.formula.api as smf # give access to function with similary syntax to R
import numpy as np

# ====== statsmodels.formula.api ======
# load data
data = sm.datasets.get_rdataset("Guerry", "HistData").data # get a pandas DataFrame

# fit regression model (using the natural log of one of the regressors)
# Lottery: the dependent variable (the class in a descrete setting)
# Literacy, Pop1831: the regressors (equivalent to the dimensions), weighted approprietly
# the intercept is automatically added
results = smf.ols('Lottery ~ Literacy + np.log(Pop1831)', data=data).fit()

# inspect the results
print(results.summary())

# ====== statsmodels.api ======
# Generate artificial data (2 regressors + constant)
nobs = 100

X = np.random.random((nobs, 2)) # create an ndarray of shape (nobs, 2)
X = sm.add_constant(X) # add the intercept: a new columns of 1; if prepend=True (default) it becomes the first columns, else it becomes the last columns
# the intercept is the value if y when X == 0; it as meaning when X is not centered
beta = [1, .1, .5] # weights given to each dimension of X
e= np.random.random(nobs) # noise
y = (X @ beta) + e # forms the classes of X by multiplying X by the weights, and adding random noise

# fit regression model
results = sm.OLS(y, X).fit()
# y is the 1D response variable, the dependent variable (the class in a discrete setting)
# X is the array of observations to regressors (entries to dimension)

# inspect the results
print(results.summary())
