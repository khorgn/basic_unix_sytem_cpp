#! /usr/bin/env python3

#pylint: disable=C0103
# load in IPython
# %load /home/hugo/Programming/python/test1/test_iris.py 

import numpy
import sklearn
import sklearn.metrics
import sklearn.preprocessing
import sklearn.multiclass
import sklearn.svm
from sklearn import datasets, model_selection, neighbors
import matplotlib.pyplot as plt

iris = datasets.load_iris(False)
X, y = datasets.load_iris(True)

# X = iris.data
# y = iris.target

X_train, X_test, y_train, y_test = model_selection.train_test_split \
(X, y, test_size=0.33, random_state=43)

knn_classifier = neighbors.KNeighborsClassifier(n_neighbors=5)

knn_classifier.fit(X_train, y_train)

y_res = knn_classifier.predict(X_test)

wrong_results = numpy.where((y_res == y_test) == False)

acc_score = sklearn.metrics.accuracy_score(y_test, y_res)

# calculate the probabilities of getting each class
probs = knn_classifier.predict_proba(X_test)
probs_setosa = probs[:,0]
probs_versicolor = probs[:, 1]
probs_virginica = probs[:, 2]
# transform the class information on a binary value, or it is part of the class or it isn't
y_setosa = numpy.array([0 if x==0 else 1 for x in y_test])
y_versicolor = numpy.array([0 if x==1 else 1 for x in y_test])
y_virginica = numpy.array([0 if x==2 else 1 for x in y_test])
# metrics.roc_curve
frp_setosa, trp_setosa, threshold_setosa = sklearn.metrics.roc_curve(
    y_setosa, probs_setosa, pos_label=0)
frp_versicolor, trp_versicolor, threshold_versicolor = sklearn.metrics.roc_curve(
    y_versicolor, probs_versicolor, pos_label=0)
frp_virginica, trp_virginica, threshold_virginica = sklearn.metrics.roc_curve(
    y_virginica, probs_virginica, pos_label=0)

auc_setosa = sklearn.metrics.roc_auc_score(y_setosa, probs_setosa)
auc_versicolor = sklearn.metrics.roc_auc_score(y_versicolor, probs_versicolor)
auc_virginica = sklearn.metrics.roc_auc_score(y_virginica, probs_virginica)




# =========================
# https://scikit-learn.org/stable/auto_examples/model_selection/plot_roc.html#sphx-glr-auto-examples-model-selection-plot-roc-py
# Import some data to play with
iris = datasets.load_iris()
X = iris.data
y = iris.target

# Binarize the output
# go from [0, ..., 1, ..., 2] to [[1,0,0], ... [0,1,0], ... [0,0,1]]
y = sklearn.preprocessing.label_binarize(y, classes=[0, 1, 2])
n_classes = y.shape[1]

# Add noise
random_state = numpy.random.RandomState(0)
n_samples, n_features = X.shape
# sample: number of entries, features: number of characteristics for each entry
# create a new ndarray containing X samples, and 200 * n_features characteristics in addition to the 4 already existing
X = numpy.c_[X, random_state.randn(n_samples, 200 * n_features)]

# shuffle and split training and test sets
X_train, X_test, y_train, y_test = sklearn.model_selection.train_test_split(
    X, y, test_size=.5, random_state=0)

# Learn to predict each class against the other
classifier = sklearn.multiclass.OneVsRestClassifier(
    sklearn.svm.SVC(kernel='linear', probability=True, random_state=random_state))
y_score = classifier.fit(X_train, y_train).decision_function(X_test)
y_res = classifier.predict(X_test)

# Compute ROC curve and ROC area for each class
fpr = dict()
tpr = dict()
roc_auc = dict()
for i in range(n_classes):
    fpr[i], tpr[i], _ = sklearn.metrics.roc_curve(y_test[:, i], y_score[:, i])
    roc_auc[i] = sklearn.metrics.auc(fpr[i], tpr[i])

# Compute micro-average ROC curve and ROC area
# y_test.ravel() returns a flat array
fpr["micro"], tpr["micro"], _ = sklearn.metrics.roc_curve(y_test.ravel(), y_score.ravel())
roc_auc["micro"] = sklearn.metrics.auc(fpr["micro"], tpr["micro"])

plt.figure()
lw = 2
plt.plot(fpr[2], tpr[2], color='darkorange', lw=lw, label='ROC curve (area = %0.2f)' % roc_auc[2])
plt.plot([0, 1], [0, 1], color='navy', lw=lw, linestyle='--')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('Receiver operating characteristic example')
plt.legend(loc="lower right")

# ====

xDimX = X_test.T[0, :]
xDimY = X_test.T[1, :]

# check the elements being unclassified
z = y_res
z[(z == 0).all(axis=1)] = -1 # unclassified elements have -1 on all columns
# unbinarize the result
z = z @ [0, 1, 2] # unclassified elements have a class < 0

fig, ax = plt.subplots()
colors = plt.cm.get_cmap("hsv", len(iris.target_names)+1) # needs to give K+1, so that there are K different colors, colors from 0 to K-1 are all differents, colors from K are all the same as 0
for i_class in range(len(iris.target_names)):
    ax.scatter(xDimX[z==i_class], xDimY[z==i_class], c=[colors(i_class)], label=iris.target_names[i_class])
ax.scatter(xDimX[z<0], xDimY[z<0], c="black", label="unclassified")

plt.title("classified scatterplot")
plt.ylabel(iris.feature_names[1])
plt.xlabel(iris.feature_names[0])
plt.legend(loc="best")

# ====
plt.show()