# https://htmlpreview.github.io/?https://github.com/jbryer/IS606Fall2015/blob/master/Pages/1_Intro_to_Data.html

# OpenIntro Ch1 Exercise 1.7
print("OpenIntro Ch1 Exercise 1.7")

# How many cases were included in the data?
print("(a) How many cases were included in the data?")
print(nrow(iris))

# How many numerical variables are included in the data? Indicate what they are, and if they are continuous or discrete.
print("(b) How many numerical vairables are included in the data? Indicate what they are, and if they are continuous or discrete.")
print(summary(iris))
print("4 numerical variables are incldued in the data.")
print("Sepal.Length: Continuous")
print("Sepal.Width: Continuous")
print("Petal.Length: Continuous")
print("Petal.Width: Continuous")

# How many categorical variables are included in the data, and what are they? List the corresponding levels (categories).
print("(c) How many categorical variables are included in the data, and what are they? List the corresponding levels (categories).")
print("1 categorical variable is incldued in the data.")
print("Species: setosa, versicolor, virginica")
