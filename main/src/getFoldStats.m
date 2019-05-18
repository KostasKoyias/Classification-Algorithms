function stats = getFoldStats(modelResult, actualResult)
    % given the classification result of a certain iteration, estimate and return statistics
    
    truePos = 0;
    trueNeg = 0;
    falsePos = 0;
    falseNeg = 0;
    sz = size(modelResult, 2);
    
    % for each record
    for i=1:sz
        
        % if classification was consice
        if(modelResult(i) == actualResult(i))
            % if result was negative, increment true negative counter
            if(modelResult(i) == -1)
                trueNeg = trueNeg + 1;
            % else if result was positive, increment true positive counter
            else
                truePos = truePos + 1;
            end
        % else if classification was incorrect
        else
            if(modelResult(i) == -1)
                falseNeg = falseNeg + 1;
            else
                falsePos = falsePos + 1;
            end
        end
    end
    stats = [truePos, trueNeg, falsePos, falseNeg];
end