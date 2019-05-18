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

The classifiers evaluated in this project along with the values set to their attributes are:

### Bayes

A probabilistic classifier, assigning a class label to an instance by estimating in which class
it is is most likely to belong to based on the attribute values the instance has.

* **Apriori probabilities**  
   Those where set to 0.655 and 0.345 for benign and malignant respectively, based on the data-description.txt

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

### Support Vector Machines

  This is a linear classifier dividing instances
into two categories trying to maximize the gap in between them, using most of the available resources
to train the model. After that, classification is extremely fast as we will see later on.  
Not many attributes to set here, default values where mainly used.

### Decision Trees

   Another eager classifier, using a tree where leaves represent class labels
and branches represent conjunctions of features that lead to those class labels.

Lastly, a common attribute shared amongst all of the above is the mis-classification cost.  
Assigning label 'benign' to a sick person is a lot more serious and might turn out fatal, while
mis-classifying a healthy person to be sick is not equally bad. So a the same cost matrix
indicating just that was used for each and every one of them.

___

## How it works

The only tool used throughout the project is MATLAB and the main script is *runClassifier.m*.
This script:

* accepts a path as an argument, and the name of the classifier as a string. Options are:

  * knn
  * bayes
  * svm
  * dtrees
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
runClassifier.m ../rsrc/data.xlsx knn % or any other of the classifier options
```

___

## End results

After experimenting with a variety of different parameters for each classifier, the following
results were collected.

| Classifier                  | Accuracy             | Sensitivity          | Specificity          | Time    |
|-----------------------------|----------------------|----------------------|----------------------|---------|
| **K-Nearest Neighbors**     |        0.97          |        0.97          |        0.97          |0.123767 |
| **Bayes Classifier**        |        0.96          |        0.98          |        0.95          |0.122200 |
| **Support Vector Machines** |        0.97          |        0.99          |        0.96          |0.150982 |
| **Decision Trees**          |        0.95          |        0.97          |        0.94          |0.111446 |

___

## Conclusion

Before choosing a specific classifier, we need to note that
Having **nominal data**(integers in range [1-10]),
makes eager algorithms an excellent choice.
Let us now take a closer look at each classifier one by one.

* **K-Nearest Neighbors**  

Lazy classifiers tend to be slower for big databases or/and large data dimensions.
Keep in mind, that this data set consists of 699 records, having 9 attributes each.
This is not too large. Along with the use of **kdtree** as a search method, performance
was pretty good and Knn turned out to be really efficient and competitive amongst the other classifiers.

* **Support Vector Machines**

An eager classifier that was pretty accurate and fast.
This classifier had the highest Sensitivity amongst classifiers, 98%.
Running this classifier, one can see that the outcome
contains just 2 falseNegative predictions, so almost all positive instances were correctly diagnosed,
although all classifiers shared the same cost matrix. This is really huge, so keep that in mind.
On the other hand, this was the slowest of all classifiers, but the difference is minimal.

* **Bayes**

Taking a look at the stats, Bayes is pretty much the average case. Not too efficient, but not bad either.
One thing to note here is that Bayes only requires a small number of training data to estimate
the parameters necessary for classification. So in this case, is a classifier to take into consideration.

* **Decision Trees**

One more eager classifier, training a model using the train set. After that, as you can see in the table above,
classification is extremely fast and efficient. Note that this was the fastest amongst classifiers, but they
were all pretty close.

All of the above had their pros and cons, but based on the end results,
the best choice in this particular case is **Support Vector Machines**, due to the importance
of categorizing a person as benign or malignant and the irreversible consequences of using a low-sensitivity classifier.  

## Epilogue

That was it, make sure you take a look at the code and execute it with various parameters.  
Feel free to comment or even contribute to this project.
Fork this repository make some changes and issue a pull request
under [this link](https://github.com/KostasKoyias/Classification-Algorithms). It will be reviewed
as soon as possible and you will get a response.  
Thanks for reading.