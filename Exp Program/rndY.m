function block = rndY(block, sequence, numblock, maxReps)

        % control variables (default values)
        firstRep=1;    % is 1st patt repeated?
        tooManyReps=1; % are there more than maxReps repetitions?
        
        randomization = 0;
        while firstRep==1 | tooManyReps==1;
            
            randomization = randomization+1 % show count on console
            firstRep=1; tooManyReps=0; ylocs = []; % initialize vars
            
            % is the first pattern a repetition?
            block = randomizeRows(block);
            if (numblock==1|isequal(block(1,145), sequence(end,145))==0); firstRep=0; end
            
            % are there more than maxReps repetitions?
            for a=1:size(block,1)
                ylocs(a) = find(block(a,:)>300 & block(a,:)<400);
                if a>=maxReps+1
                    repeats=1;
                    for r=1:maxReps
                        if ylocs(a)==ylocs(a-r); repeats=repeats+1; end
                    end
                    if repeats>maxReps; tooManyReps=1; end
                end
            end
            
        end


    function [Y] = randomizeRows(X)
        [numRows, numCols] = size(X);
        indices = randperm(numRows);
        Y = X(indices, :);
    end

end