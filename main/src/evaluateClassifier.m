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
    displayResults([records, stats, accuracy, sensitivity, specificity]);
end