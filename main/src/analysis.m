function analysis(path, classifierName)
    % this function accepts as arguments a path to a .xlsx file 
    % containing the data and a classifier to work on them    
    classifier = str2func(classifierName);
    
    % open file and put all data in a matrix
    data = xlsread(path);
    [rows, cols] = size(data);
    
    % normalize data attributes, range is [1-10] so divide by 10
    % but do not modify labels, so exlude last column
    data(:, 1:cols-1) = data(:, 1:cols-1)./10;
    
    % replace missing attribute values with the most common one
    data = fillEmpty(data);
    
    % perform 10-k cross validation on the given data set
    % using the 2nd argument as a classifier
    k = 10;
    classifierStats = zeros(1, 4);
    setSize = ceil(rows/k);
    for i=1:setSize:rows
        
        % get training, test and result sets for this fold
        [trainSet, testSet, actualResult] = getSets(data, i, setSize);
        
        % pass sets to classifier and get end result of model
        modelResult = classifier(trainSet, testSet);
        
        % compare it with the actual result
        classifierStats = classifierStats + getFoldStats(modelResult, actualResult);
    end
    % after collecting stats from all k folds, evaluate this classifier
    evaluateClassifier(classifierStats);
end