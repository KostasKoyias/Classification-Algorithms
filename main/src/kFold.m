function classifierStats = kFold(data, classifier, k)
    % perform a k-fold cross-validation on the data passed as the 1st
    % argument, using the model of the classifier specified in the 2nd argument
    % then, collect and return statistics about this classification
    
    rows = size(data, 1);
    classifierStats = zeros(1, 4);
    setSize = ceil(rows/k);
    
    % for each data partition
    for i=1:setSize:rows
        
        % get training, test and result sets for this partition
        [trainSet, testSet, actualResult] = getSets(data, i, setSize);
        
        % pass sets to classifier and get end result of model
        modelResult = transpose(predict(getModel(trainSet, classifier), testSet));
        
        % compare it with the actual result
        classifierStats = classifierStats + getFoldStats(modelResult, actualResult);
    end
end