function runClassifier(path, classifierName)
    % this function accepts as arguments a path to a .xlsx file 
    % containing the data and a classifier to work on them    
    classifier = str2func(classifierName);
    
    % open file and put all data in a matrix
    data = xlsread(path);
    
    % normalize data and replace missing attribute values
    data = preProcessData(data);
    
    % perform 10-k cross validation on the given data set
    % using the 2nd argument as a classifier
    k = 10;
    tic;
    classifierStats = kFold(data, classifier, k);
    t = toc;
    
    % after collecting stats from all k folds, evaluate this classifier
    evaluateClassifier(classifierStats);
    fprintf("-------------------\nElapsed Time: %f\n", t);
end