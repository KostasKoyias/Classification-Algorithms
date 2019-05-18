function model = bayes(X, Y)
    %implementation of a bayes classifier
    model = fitcnb(X, Y, 'Cost', [0 0.25; 0.75 0]); 
    model.Prior = struct('ClassNames',[-1, 1],'ClassProbs',[0.655; 0.345]);
end