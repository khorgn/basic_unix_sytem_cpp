#!/bin/env python3

#pylint: disable=C0103, C0111, W0105, C0301, C0326

import seaborn
import pandas


iris = seaborn.load_dataset("iris") # load a pandas DataFrame
iris.head() # show the first few entries
iris.get("species") # get all the entries for the given column
a=iris["species"]
a=iris.iloc[0] # get all the characteristics of the first entry
# can get a precise line with get(...)[linesNum] and a precise characteristic with iloc[...][characteristics_name_or_num]
a=iris.loc[0] # used with labels, will show a difference if an index is set
a=iris.at[0, "species"]
a=iris.iat[0, 4]
a=iris.shape
a=iris.iloc[:, 4] #same as iris.get("species")
a=iris.loc[:, "species"] #same as iris.get("species")

df = pandas.DataFrame({'month': [1, 4, 7, 10],
                       'year': [2012, 2014, 2013, 2014],
                       'sales': [55, 40, 84, 31]})
df2 = df.set_index("month") # set the column month as the index of the dataframe
df.loc[4] = [11, 2000, 30] # insert a new entry
df2.loc[2] = [2010, 45] # insert a new entry for the month 2
df['D'] = df.index # create a new column, fills it with the index values
df2.reset_index() # reset the index of the DataFrame

c = pandas.read_csv("https://raw.githubusercontent.com/cs109/2014_data/master/countries.csv")
print(c.head())

c = c.dropna() # remove all entries where there are NaN
