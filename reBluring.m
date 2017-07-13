clc
close all

%% blur proccess
img = imread('img/Lenna_128_greyscale.jpg');

intImage = integralImage(img);

% set blur intensity & execute
avgH = integralKernel([1 1 3 3], 1/9);
imgBlur = integralFilter(intImage, avgH);
imgBlur = uint8(imgBlur);
 
% blur iamge
figure;
imshow(imgBlur);

%% genetic algorithm

% convert imgBlur to kromosom
imgData = double(imgBlur);
winSize=3;
chrom = 1;
gen = 9;
genMean = ceil(gen/2);

% init population
totalPop = 60;

% init image matrix result
[x,y] = size(imgData);
imgRes = zeros(x,y);

% running time checker
tic();

for row = 1:x-2
    for col = 1:y-2
        
        % just for debug
        fprintf('currently processing on ROW: %d and COLUMN: %d\n', row, col);

        % convert to 1 * 9 matrix
        chromVal = reshape(imgData(row:row+2,col:col+2),[chrom,gen]);
        chromMean = chromVal(genMean);

        % generate population
        % random 0 - 2 for matrix (pop,gen)
        pop = randi([0 255], totalPop, gen);

        epoc = 0;
        
        while epoc < 300
            % fitness function
            fitVal = fitFunc(gen,chromMean,totalPop,pop);

            % parent selection
            for i = 1:totalPop
                select = parSelect(fitVal);

                % replace with new selected chromosome
                pop(i,:) = pop(select,:);
            end

            % crossover
            pop = doCrossover(pop);

            % mutation
            pop = doMutation(pop);

            epoc = epoc + 1;
        end

        % get nearest fitness value index
        [~,best] = max(fitVal);

        % get best chromosome
        inBest = pop(best,:); 

        % convert to 3 * 3 matrix
        imgRes(row,col:col+2) = inBest(:,1:3);
        imgRes(row+1,col:col+2) = inBest(:,4:6);
        imgRes(row+2,col:col+2) = inBest(:,7:9);
    end
end

intImgRes = uint8(imgRes);
figure;
imshow(intImgRes);

% running time checker
toc();