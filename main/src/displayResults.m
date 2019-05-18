function displayResults(results)
    records = results(1);
    truePositive = results(2);
    trueNegative = results(3);
    falsePositive = results(4);
    falseNegative = results(5);
    accuracy = results(6);
    sensitivity = results(7);
    specificity = results(8);
    
    % display end results of a classifier's evaluation
    fprintf("Records: %d\n", records);    
    disp("-------------------");
    fprintf("Accuracy: %.2f\nSensitivity: %.2f\nSpecificity: %.2f\n", accuracy, sensitivity, specificity);
    disp("-------------------");
    fprintf("truePositive: %d\ntrueNegative: %d\n", truePositive, trueNegative);
    fprintf("falsePositive: %d\nfalseNegative: %d\n", falsePositive, falseNegative);
end

