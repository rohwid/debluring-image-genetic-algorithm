function parIndex = parSelect(value)
    % all population saved by column
    chromPop = size(value,2);
    
    % pick random number between 0 - sumVal
    sumVal = sum(value);
    randPick = (sumVal - 0) * rand(1,1) + 0;        
    partialFitSum = 0;
    
    for j = 1:chromPop
        % select chromosom by partial fitness sum vs randpick
        partialFitSum = partialFitSum + sum(value(1,j));

        if partialFitSum >= randPick
            parIndex = j;
            break
        end
    end
end