function data = preProcessData(data)
    % pre-process data
    cols = size(data, 2);
    
    % normalize data attributes, range is [1-10] so divide by 10
    % but do not modify labels, so exlude last column
    data(:, 1:cols-1) = data(:, 1:cols-1)./10;
    
    % replace missing attribute values with the most common one
    data = fillEmpty(data);
end

function data = fillEmpty(data)  
    % replace missing attribute values of each field with the most common
    
    % get number of columns 
    cols = size(data, 2);
    
    % for each column-attribute, except for the last one(label)
    for j = 1:cols-1
        col = data(:,j);
        
        % get the most frequent numeric value
        mostFrequent = mode(col);
        
        % replace missing values with the most common
        col(isnan(col)) = mostFrequent;
        data(:,j) = col;
    end
    % replace 2 with -1, and 4 with 1 to better indicate negative and positive 
    data(:, cols) = data(:, cols)-3;
end