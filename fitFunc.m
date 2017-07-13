function value = fitFunc(gen,chromMean,inTotal,inPop)  
    % init column to save fitness value
    value = zeros(1,inTotal);

    for i = 1:inTotal
        inPopMean = sum(inPop(i,:))/gen;
        value(1,i) = 1/((inPopMean - chromMean)^2);
    end
end