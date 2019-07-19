#!/bin/env python3

#pylint: disable=C0103, C0111, W0105, C0301, C0326


import seaborn
import matplotlib.pyplot as plt


iris = seaborn.load_dataset("iris") # load a pandas DataFrame



seaborn.swarmplot(data=iris)
plt.show()

seaborn.swarmplot(x="species", y="petal_length", data=iris)
plt.show()

titanic = seaborn.load_dataset("titanic")
seaborn.catplot("class", "survived", "sex", data=titanic, kind="bar", palette="muted")
plt.show()

seaborn.catplot(x="species", y="petal_length", data=iris, kind="swarm")
plt.show()

# === Categorical data ===
# catplot is the default plot for categorical data, the kind parameter then give access to the other kinds
#kinds:
# categorical scatterplot:
#    stripplot() kind="strip"; default
#    swarmplot() kind="swarm"
# categorical distribution:
#    boxplot() kind="box"
#    violinplot() kind="violin"
#    boxenplot() kind="boxen"
# categorical estimate:
#    pointplot() kind="point"
#    barplot() kind="bar"
#    countplot() kind="count"

# === Relational data ===
# relplot is the default plot for relational data, the kind parameter then give access to the other kinds
#kinds:
# scatterplot() kind="scatter"; default; the standard scatter plot
# lineplot() kind="line"; the standard line plot


seaborn.scatterplot(x="petal_width", y="petal_length", data=iris, hue="species", palette="muted")
plt.show()


# multiple plots on one figure and one axe
fig, ax = plt.subplots()
seaborn.scatterplot(x="petal_width", y="petal_length", data=iris, hue="species", palette="muted", ax=ax)
seaborn.lineplot(x="petal_width", y="petal_length", data=iris, hue="species", ax=ax)
plt.show()

# multiple plots on one figure and multiple axe
fig, (ax1, ax2, ax3) = plt.subplots(nrows=1, ncols=3)
seaborn.scatterplot(x="petal_width", y="petal_length", data=iris, hue="species", palette="muted", ax=ax1)
seaborn.lineplot(x="petal_width", y="petal_length", data=iris, hue="species", ax=ax2, legend=False)
ax2.set_ylabel("")
plt.show()

# multiple plots on multiple figures
fig, ax = plt.subplots()
fig2, ax2 = plt.subplots()
seaborn.scatterplot(x="petal_width", y="petal_length", data=iris, hue="species", palette="muted", ax=ax)
seaborn.lineplot(x="petal_width", y="petal_length", data=iris, hue="species", ax=ax2, legend=False)
plt.show()

# the `FutureWarning: Using a non-tuple sequence for multidimensional indexing is deprecated`
# is on scipy -- used by seaborn -- side, no end-user side
