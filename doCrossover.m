function res = doCrossover(pop)
    % divide row
    chromTot = size(pop,1);
    divChrom = chromTot/2;
    
    % row divided
    pop1 = pop(1:divChrom,:);
    pop2 = pop(divChrom + 1:chromTot,:);
    
    % duplicate row to cross
    xPop1 = pop1;
    xPop2 = pop2;
    
    % one point crossover
    setPoint = randi(9);
    xPop2(:,1:setPoint) = pop1(:,((9 - setPoint) + 1):9);
    xPop1(:,((9 - setPoint) + 1):9) = pop2(:,1:setPoint);
    
    % crossovered population
    res = [xPop1; xPop2];
end

