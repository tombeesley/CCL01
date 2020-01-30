function patt = makePatt(tlocs, numDist)

    % tlocs on each quadrant
    tqA = sum(tlocs <= 36);
    tqB = sum((tlocs > 36)&(tlocs <= 72));
    tqC = sum((tlocs > 72)&(tlocs <= 108));
    tqD = sum(tlocs > 108);

    % build quadrants
    qA = randomQuadrant(tqA,numDist);
    qB = randomQuadrant(tqB,numDist);
    qC = randomQuadrant(tqC,numDist);
    qD = randomQuadrant(tqD,numDist);
    patt = [qA, qB, qC, qD];

    % put zeros in reserved tlocs
    tlocs = sort(tlocs);
    for n = 1:length(tlocs)
        patt = [patt(1:(tlocs(n)-1)), 0,patt(tlocs(n):end)];
    end
                
    function quadrant = randomQuadrant(nLocsReserved, numDistractors)
        quadrant =[];
        for i=1:numDistractors % add distractors
            distractor = 100 + ((floor(rand * 4) + 1)* 10) + (floor(rand * 4) + 1);
            quadrant = [quadrant, distractor];
        end
        quadrant = [quadrant, zeros(1, (36-numDistractors)-nLocsReserved)];
        quadrant = quadrant(randperm(length(quadrant)));
    end

end