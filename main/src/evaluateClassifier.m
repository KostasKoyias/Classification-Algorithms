function [accuracy, sensitivity, specificity] = evaluateClassifier(stats)
    % given a set of statistics, evaluate a classifier
    truePositive = stats(1);
    trueNegative = stats(2);
    falsePositive = stats(3);
    falseNegative = stats(4);
    records = sum(stats);
    accuracy = (truePositive + trueNegative)/records;
    sensitivity = truePositive / (truePositive + falseNegative);
    specificity = trueNegative / (trueNegative + falsePositive);

    % display results
    fprintf("Records: %d\n", records);    
    disp("-------------------");
    fprintf("Accuracy: %.2f\nSensitivity: %.2f\nSpecificity: %.2f\n", accuracy, sensitivity, specificity);
    disp("-------------------");
    fprintf("truePositive: %d\ntrueNegative: %d\n", truePositive, trueNegative);
    fprintf("falsePositive: %d\nfalseNegative: %d\n", falsePositive, falseNegative);
end