function res = doMutation(pop)
    % binary mutation
    chromPop = size(pop,1);
    
    for i=1:chromPop
        % select random gen position from chromosom
        selectGen = randi(9);

        % get decimal number from random gen
        getDec = pop(i, selectGen);
        
        % convert random gen to binary
        conv2Bit = de2bi(getDec,8);
        
        % select random bit position from gen
        selectBin = randi(8);
        
        % do mutation in binary level
        inputBit = conv2Bit(1,selectBin);
        
        if inputBit == 1
            outputBit = 0;
        else
            outputBit = inputBit;
        end
        
        conv2Bit(1,selectBin) = outputBit;
        
        % convert gen to decimal
        pop(i, selectGen) = bi2de(conv2Bit);
    end
    
    res = pop;
end

