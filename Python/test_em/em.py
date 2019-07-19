#! /usr/bin/env python3
#pylint: disable=C0103

import numpy as np
import scipy as scp
from sklearn.cluster import k_means

from generate_multigaussian import generate_multigaussian, plot_multigaussian

N = 300 # number of elements
K = 3 # number of classes
D = 2 # number of dimensions

data, real_classes = generate_multigaussian(N, K, D)

epsi = 10**-6
max_ite = 10

# default vector for the probabilities of each classes
Pi = 1/K * np.ones((K))

# Likeness
L = [0]

# use kmeans to get the default Mu
(Mu, labels, _) = k_means(data, K)
# last member is inertia: the sum of the squared distance of all points of the training set to the closest centroid

# Default sigma (covariance for each class)
Sigma = np.zeros((D, D, K))
for k in range(K):
    Xk = data[labels == k, :]
    Sigma[:, :, k] = np.cov(Xk.T)

# Sigma = Sigma0
Sigma = [Sigma]
# Mu = Mu0
Mu = [Mu]
# Pi = Pi0
Pi = [Pi]
converges = False
ite = -1
while not converges:
    ite += 1

    # E-step:
    probXk = np.zeros((N, K))
    for k in range(K):
        # the unnormalized probability that x is owned by k
        probXk[:, k] = Pi[ite][k] * scp.stats.multivariate_normal.pdf(data, mean=Mu[ite][k, :], cov=Sigma[ite][:, :, k])
        # probability density function
    
    # The sum of probabilities for each point
    # [..., np.newaxis] transform from a vector [300,] to a matrix [300, 1]
    # can also to np.sum(probXk, 1)[np.newaxis].T or np.array([np.sum(probXk, 1)]).T or (only if 1D array) np.sum(probXk, 1).reshape(-1, 1)
    totalX = np.sum(probXk, 1)
    # The probability of X to be part of each class
    # "/" is element-wise division. to do a matrix division do
    # A @ B.I where B.I is the inverse of B
    # B must be invertible
    Tau_ik = probXk / np.outer(totalX, np.ones(K))

    # TODO check all of M-step
    # M-step:
    Pi.append(np.zeros((K)))
    Mu.append(np.zeros((K, D)))
    Sigma.append(np.zeros((D, D, K)))
    Pi[ite+1] = np.sum(Tau_ik, 0) / N
    for k in range(K):
        # n_k**q the number of values in k at the iteration q
        # z = np.argmax(Z, 1)
        # np.count_nonzero(z == k)

        # TODO explanation
        Mu[ite+1][k, :] = 1/np.sum(Tau_ik[:, k]) * np.sum(np.tile(Tau_ik[:, k], (D, 1)).T * data, 0)

        # TODO explanation
        Sigma[ite+1][:, :, k] = 1 / sum(Tau_ik[:, k]) * \
        ( np.outer(Tau_ik[:, k], np.ones(D)) * (data - np.tile(Mu[ite+1][k, :], (N, 1))) ).T  \
        @ \
        ( data - np.tile(Mu[ite+1][k, :], (N, 1)))
    
    # Calculate the log likeness
    # TODO explanation
    L.append(np.sum(np.log(totalX)))

    if ite >= max_ite or np.abs( (L[ite+1] - L[ite]) / L[ite+1] ) < epsi:
        converges = True


plot_multigaussian(data, real_classes)

print("function for class 1: Mu={} ; Sig={}".format(Mu[-1][0, :], Sigma[-1][:, :, 0]))
print("function for class 2: Mu={} ; Sig={}".format(Mu[-1][1, :], Sigma[-1][:, :, 1]))
print("function for class 3: Mu={} ; Sig={}".format(Mu[-1][2, :], Sigma[-1][:, :, 2]))