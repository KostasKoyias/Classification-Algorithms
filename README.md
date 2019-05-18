# Classification-Algorithms Evaluation

## Introduction

The goal of this project is to evaluate a set of classifiers, based on their:

* accuracy
* sensitivity and
* specificity

___

## Data set

The data set used for this project was obtained from a breast-cancer database
and can be found [here](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29).  
A quick description of it, follows:

* The number of instances is 699.
* Each instance has one of 2 possible classes: **benign**(65.5%) or **malignant**(34.5%),
denoted by a 2 and a 4 respectively, which a later on replace with -1 and 1.
* Each instance has 9 attributes scaled in [1-10] plus the class label.
* Missing attributes, which are 16 in total, were replaced with the most frequent value.

___

## Classifiers

The classifiers evaluated in this project are:

### K-Nearest Neighbors

In this case, the object is classified by a plurality vote of its neighbors.

* **BreakTies**

  In case of a tie, the class of the nearest one is used.

* **k selection**

   In order to optimize performance k was set to the square root of the training set's size.
   Generally, larger values of k reduces effect of the noise on the classification,
   but make boundaries between classes less distinct.

* **Neighbor effect**

  To get the nearer neighbors contribute more to the average
  than the more distant ones, each neighbor's effect was weighted.
  The distance metric used is the **euclidean**.

* **Search Method**

In order to get optimal performance the nearest neighbors were found, using a **Kd-tree**.
___

## How it works

The only tool used throughout the project is MATLAB and the main script is *analysis.m*.
This script:

* accepts a path as an argument, and the name of the classifier as a string. Options are:

  * knn
  * bayes
  * svm
  * dtrees
  * perceptron
* opens the .xlsx file under that certain path and
  * normalizes the data by dividing each attribute value with 10(remember that these values scale in [1-10]).
  * replaces all missing attribute values with the most frequent one
* performs a **10-fold cross-validation**.  
To do that, the data set is partitioned into 10 subsets
having the same or almost the same size and 10 iterations take place.  
In the i-th iteration, the i-th subset is
extracted. What is left is used to train the model of the classifier and the extracted part
is later on used as a test set.
* after the algorithm converges, the classifier is evaluated and the end results are displayed.

___

## How to run it

In order to classify the data yourself, clone that repository
and open up matlab under /main/src. As soon as the command window opens up, type:

```matlab
analysis.m ../rsrc/data.xlsx knn % or any other of the classifier options
```

___

## End results

After experimenting with a variety of different parameters for each classifier, the following
results were collected.

| Classifier                  | Accuracy             | Sensitivity          | Specificity          |
|-----------------------------|----------------------|----------------------|----------------------|
| **Multilayer Perceptron**   |                      |                      |                      |
| **K-Nearest Neighbors**     |        0.96          |        0.92          |        0.98          |
| **Bayes Classifier**        |                      |                      |                      |
| **Support Vector Machines** |                      |                      |                      |
| **Decision Trees**          |                      |                      |                      |

___

## Conclusion

Before choosing a specific classifier, we need to note the following,
taking into consideration the nature of the data:

* **K-Nearest Neighbors**  
Lazy classifiers tend to be slower for big databases or/and large data dimensions.
Keep in mind, that this data set consists of 699 records, having 9 attributes each.
This is not too large. Along with the use of **kdtree** as a search method, performance
was pretty good and Knn turned out to be really efficient and competitive amongst the other classifiers.

* In addition, all other algorithms tend to be too
expensive for numeric data, but this is not the case here.
Having **nominal data**(integers in range [1-10]),
makes those algorithms an excellent choice. So, Knn has to be rejected.

So to decide, based on the end results,
the best choice for this particular data set is probably

That was it, thanks for reading, make sure you take a look at the code and execute it with various parameters.
Feel free to comment or even contribute to this project.
Fork this repository make some changes and issue a pull request
under [this link](https://github.com/KostasKoyias/Classification-Algorithms). It will be reviewed
as soon as possible and you will get a response.