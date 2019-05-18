function result = knn(trainSet, testSet)

    % get dimensions of train set
    [instancesNumber, attributesNumber] = size(trainSet);
    
    % set k to sqrt of instances for optimal performance
    k = ceil(sqrt(instancesNumber));
    
    % create attributes set and classes set
    X = trainSet(:, 1:attributesNumber-1);
    Y = trainSet(:, attributesNumber);
    
    % create model and set it's properties, search method = kdtree 
    % by default due to fact that the number of attributes is <= 10
    model = fitcknn(X, Y);
    model.BreakTies = 'nearest';
    model.NumNeighbors = k;
    model.Distance = 'euclidean';
    model.DistanceWeight = 'inverse';
    
    result = transpose(predict(model, testSet));
    %result = ones(1, size(testSet,1))*1; 
end