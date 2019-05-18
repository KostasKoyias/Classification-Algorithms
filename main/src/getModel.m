function model = getModel(trainSet, classifier)
    % given a trainSet and a classifier, train a model of the classifier
    % using the trainSet and return the result
        
    % get number of attributes
    attributesNumber = size(trainSet, 2);
    
    % create attributes set and classes set
    X = trainSet(:, 1:attributesNumber-1);
    Y = trainSet(:, attributesNumber);
    
    % get the model of this particular classifier after it is trained
    % assigning label 'benign' to a sick person is a lot more serious 
    % than mis-classifying a healthy person to be sick
    model = classifier(X, Y);        
end