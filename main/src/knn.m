function result = knn(trainSet, testSet)
    [instancesNumber, attributesNumber] = size(trainSet);
    k = ceil(sqrt(instancesNumber));
    X = trainSet(:, 1:attributesNumber-1);
    Y = trainSet(:, attributesNumber);
    model = fitcknn(X,Y);
    %model.BreakTies = 'nearest';
    %model.Neighbors = k;
    %disp(model);
    
    
    result = ones(1, size(testSet,1))*1; 
end