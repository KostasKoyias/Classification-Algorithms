function [trainSet, testSet, actualResult] = getSets(data, i, setSize)
    % given a data set extract a subset of it for testing exluding
    % the class attribute, the rest of it will be used for training
    
    [rows, cols] = size(data);
    setEnd = min(i + setSize -1, rows);
    
    % trainSet gets data excluding testSet
    trainSet = data;
    trainSet(i:setEnd, :) = [];
    
    % extract testSet from data set putting the class attribute in actualResult 
    testSet = data(i:setEnd, :);
    actualResult = transpose(testSet(:, cols:cols))*10;
    testSet = testSet(:, 1:cols-1);
end

