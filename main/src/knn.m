function model = knn(X, Y)
    % implementation of a knn classifier
    
    % get number of instances
    instancesNumber = size(X, 1);
    
    % set k to sqrt of instances for optimal performance
    k = ceil(sqrt(instancesNumber));
    
    % create model and set it's properties, search method = kdtree 
    % by default due to fact that the number of attributes is <= 10
    model = fitcknn(X, Y, 'Cost', [0 0.25; 0.75 0]);
    model.BreakTies = 'nearest';
    model.NumNeighbors = k;
    model.Distance = 'euclidean';
    model.DistanceWeight = 'inverse';
end