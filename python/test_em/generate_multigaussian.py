#! /usr/bin/env python3
#pylint: disable=C0103, C0111, W0105, C0301, C0326

#============================

# Here we have 2 classes and 2 dimensions

# X = X_train(:, 1:2);
# K =3;
# max_iter = 1000;
# epsilon = 10^-6;
#=======================
#[mu, z] = kmeans(max_iter, epsilon, X, K);


#mnrnd
#mvnrnd

# We want to generate values according to a Gaussian Mixed Model
# classes and probabilities
# center mu
# values sigma

import numpy as np
from matplotlib import pyplot as plt

"""
N = 300 # number of elements
K = 3 # number of classes
D = 2 # number of dimensions


P = np.random.rand(K, 1)
P = P/np.sum(P)

# Gen 0 (prob 0.1) or 1 (prob 0.9)
Z = np.zeros((N, K))
for i in range(N):
    Z[i, :] = np.random.multinomial(1, P.ravel())

# Gen vector prob of being part of k
Pi = 1/K * np.ones((1, K))

# Gen mu
MUk = np.array([[3,-3],[3,3],[-3,-3]])

# Gen sigma in 3 classes
sig = np.zeros((D, D))
sig = sig[..., np.newaxis] # add new dimension
sig[:, :, 0] = np.eye(D) # identity matrix
sig = np.concatenate((sig, 0.3*np.eye(D)[..., np.newaxis]), 2)
sig = np.concatenate((sig, np.array([[1, 0.5], [0.5, 1]])[..., np.newaxis]), 2)

data = np.zeros((N, D))
z = np.argmax(Z, 1) # gives the index of the max for each element

for k in range(K):
    data[z == k, :] = np.random.multivariate_normal(MUk[k, :], sig[:, :, k], np.count_nonzero(z == k))
    # np.random.multivariate_normal(MUk[k, :], sig[:, :, k], np.count_nonzero(z == k)) generate np.count_nonzero(z == k) variables following the Mu and Sigma given


# show plot
from matplotlib import pyplot as plt
x, y = data.T
plt.scatter(x, y)


fig, ax = plt.subplots()

ax.scatter(x[z == 0], y[z == 0], c="red", label="Red category")
ax.scatter(x[z == 1], y[z == 1], c="green", label="Green category")
ax.scatter(x[z == 2], y[z == 2], c="blue", label="Blue category")

plt.title("classified scatterplot")
plt.ylabel("Y")
plt.xlabel("X")
plt.legend(loc="best")

# plt.show()
"""

"""
Generates n_points points in n_dimensions dimensions following a multigaussian distribution, following n_classes gaussians

Parameters
----------
n_points: int
    the number of points to generate
n_classes: int
    the number of gaussians to generate
n_dimensions: int
    the number of dimensions of the points generated

Returns
-------
tuple
    returns a tuple containing: the data in shape(n_points, n_dimensions); and the class of each point in shape(n_points)
"""
def generate_multigaussian(n_points=300, n_classes=3, n_dimensions=2) -> (np.ndarray, np.ndarray):
    N = n_points
    K = n_classes
    D = n_dimensions

    P = np.random.rand(K, 1)
    P = P/np.sum(P)

    # Gen 0 (prob 0.1) or 1 (prob 0.9)
    Z = np.zeros((N, K))
    for i in range(N):
        Z[i, :] = np.random.multinomial(1, P.ravel())

    # Gen vector prob of being part of k
    Pi = 1/K * np.ones((1, K))

    # Gen mu
    MUk = np.array([
        np.array([3 if i%2==0 else -3 for i in range(D)]),
        3*np.ones(D),
        -3*np.ones(D)
    ]) #TODO works only for  3 classes

    # Gen sigma in 3 classes
    #TODO works only for 3 classes
    sig = np.zeros((D, D))
    sig = sig[..., np.newaxis] # add new dimension
    sig[:, :, 0] = np.eye(D) # identity matrix
    sig = np.concatenate((sig, 0.3*np.eye(D)[..., np.newaxis]), 2)
    sig = np.concatenate((sig, np.array([[1, 0.5], [0.5, 1]])[..., np.newaxis]), 2)

    data = np.zeros((N, D))
    z = np.argmax(Z, 1) # gives the index of the max for each element

    for k in range(K):
        data[z == k, :] = np.random.multivariate_normal(MUk[k, :], sig[:, :, k], np.count_nonzero(z == k))
        # np.random.multivariate_normal(MUk[k, :], sig[:, :, k], np.count_nonzero(z == k)) generate np.count_nonzero(z == k) variables following the Mu and Sigma given

    return (data, z)

"""
Plots and displays a scattering of points according to to chosen dimensions and a list of class belonging for each point

Parameters
----------
data: numpy.ndarray
    the number of points to generate
    shape (n_points, n_dimensions)
z: numpy.ndarray
    the corresponding class for each point of data
    shape (n_points,)
index_dimensionX: int
    the index of the X dimension chosen among the dimensions in data
index_dimensionY: int
    the index of the Y dimension chosen among the dimensions in data
"""
def plot_multigaussian(data, z, index_dimensionX=0, index_dimensionY=1):
    N = data.shape[0]
    dimX = index_dimensionX
    dimY = index_dimensionY
    K = np.max(z)+1

    x = data.T[dimX, :]
    y = data.T[dimY, :]
    # plt.scatter(x, y)

    fig, ax = plt.subplots()
    colors = plt.cm.get_cmap("hsv", K+1) # needs to give K+1, so that there are K different colors, colors from 0 to K-1 are all differents, colors from K are all the same as 0
    for i_class in range(K):
        ax.scatter(x[z == i_class], y[z == i_class], c=[colors(i_class)], label="category {}".format(i_class+1))
    # ax.scatter(x[z == 0], y[z == 0], c="red", label="Red category")
    # ax.scatter(x[z == 1], y[z == 1], c="green", label="Green category")
    # ax.scatter(x[z == 2], y[z == 2], c="blue", label="Blue category")

    plt.title("classified scatterplot")
    plt.ylabel("Y")
    plt.xlabel("X")
    plt.legend(loc="best")

    plt.show()

"""
Generates spaced colors for a given number of colors

Parameters
----------
n_colors: int
    the number of colors to generate
"""
def get_spaced_colors(n_colors):
    max_value = 16581375 #255**3
    interval = int(max_value / n_colors)
    colors = [hex(I)[2:].zfill(6) for I in range(0, max_value, interval)]

    return np.array([(int(i[:2], 16), int(i[2:4], 16), int(i[4:], 16)) for i in colors])
