function outpatt = removeL(inpatt)

    % find T
    tloc = find(inpatt>200 & inpatt<300);
    
    % find quadrant
    if tloc <= 36
        quad=1;
    elseif tloc <= 72
        quad = 2;
    elseif tloc <= 108
        quad = 3;
    else
        quad = 4;
    end

    switch quad
        case 1
            subpatt = inpatt(1:36);
            Llocs = find(subpatt>100 & subpatt<200);
            removedL = Llocs(randi(numel(Llocs)));
            subpatt(removedL) = 0;
            inpatt(1:36) = subpatt;
        case 2
            subpatt = inpatt(37:72);
            Llocs = find(subpatt>100 & subpatt<200);
            removedL = Llocs(randi(numel(Llocs)));
            subpatt(removedL) = 0;
            inpatt(37:72) = subpatt;
        case 3
            subpatt = inpatt(73:108);
            Llocs = find(subpatt>100 & subpatt<200);
            removedL = Llocs(randi(numel(Llocs)));
            subpatt(removedL) = 0;
            inpatt(73:108) = subpatt;
        case 4
            subpatt = inpatt(109:144);
            Llocs = find(subpatt>100 & subpatt<200);
            removedL = Llocs(randi(numel(Llocs)));
            subpatt(removedL) = 0;
            inpatt(109:144) = subpatt;
    end

    outpatt = inpatt;
    
end