function analysis(path)
    % this function accepts a path to a .xlsx file in the system as an argument
    
    % open file and put all data in a matrix
    data = xlsread(path);
    
    % normalize data, range is [1-10], so divide by 10
    data = data./10;
    
    % replace missing attribute values with the most common one
    data = fillEmpty(data);
    
    % perform 10-k cross validation on the given data set
    % using the 2nd argument as a classifier
    k = 10;
    rows = size(data, 1);
    classifierStats = zeros(1, 4);
    setSize = ceil(rows/k);
    for i=1:setSize:rows
        
        % get training, test and result sets for this fold
        [trainSet, testSet, actualResult] = getSets(data, i, setSize);
        
        % pass sets to classifier and get end result of model
        modelResult = knn(testSet);
        
        % compare it with the actual result
        classifierStats = classifierStats + getFoldStats(modelResult, actualResult);
    end
    % after collecting stats from all k folds, evaluate this classifier
    evaluateClassifier(classifierStats);
end