function data = fillEmpty(data)  
    % replace missing attribute values of each field with the most common
    
    % get number of columns
    cols = size(data, 2);
    
    % for each column-attribute
    for j = 1:cols
        col = data(:,j);
        
        % get the most frequent numeric value
        mostFrequent = mode(col);
        
        % replace missing values with the most common
        col(isnan(col)) = mostFrequent;
        data(:,j) = col;
    end
end