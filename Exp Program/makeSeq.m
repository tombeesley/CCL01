function sequence = makeSeq(Tlocs, Rlocs, numBlocks1A, numBlocks1B, numBlocks2)

    % decide tcols
    tcols = randperm(4)*10;
    
    old1001 = [makePatt(Rlocs,4), 1001];
    old1002 = [makePatt(Rlocs,4), 1002];
    old1003 = [makePatt(Rlocs,4), 1003];
    old1004 = [makePatt(Rlocs,4), 1004];
    old1001(Tlocs(1)) = 200 + tcols(1);
    old1002(Tlocs(2)) = 200 + tcols(2);
    old1003(Tlocs(3)) = 200 + tcols(3);
    old1004(Tlocs(4)) = 200 + tcols(4);
    old1001 = removeL(old1001);
    old1002 = removeL(old1002);
    old1003 = removeL(old1003);
    old1004 = removeL(old1004);
    
    % for stage 2
    % en 101X la Y está en el mismo lado que la T
    % en 102X la Y está en el lado contrario
    old1011 = insertY(old1001,32,1011);
    old1012 = insertY(old1002,70,1012);
    old1013 = insertY(old1003,32,1013);
    old1014 = insertY(old1004,70,1014);
    old1021 = insertY(old1001,70,1021);
    old1022 = insertY(old1002,32,1022);
    old1023 = insertY(old1003,70,1023);
    old1024 = insertY(old1004,32,1024);
    
    % declare output matrix
    sequence = [];
    
    % stage 1A
    for n = 1:numBlocks1A
        
        block = [];
        block = [block; old1001; old1002; old1003; old1004];
        
        % sort without repetitions
        k = 0;
        while k == 0
            block = randomizeRows(block);
            if (n==1|isequal(block(1,145), sequence(end,145))==0); k=1; end
        end
        
        block = insertOr(block); % insert T orientation
        block(:,146) = n;        % insert block number
        sequence = [sequence; block];
    
    end
    
    % stage 1B
    for n = numBlocks1A+1:numBlocks1A+numBlocks1B
        
        % build new patts
        new2001 = [makePatt(Rlocs,4), 2001];
        new2002 = [makePatt(Rlocs,4), 2002];
        new2003 = [makePatt(Rlocs,4), 2003];
        new2004 = [makePatt(Rlocs,4), 2004];
        new2001(Tlocs(1)) = 200 + tcols(1);
        new2002(Tlocs(2)) = 200 + tcols(2);
        new2003(Tlocs(3)) = 200 + tcols(3);
        new2004(Tlocs(4)) = 200 + tcols(4);
        new2001 = removeL(new2001);
        new2002 = removeL(new2002);
        new2003 = removeL(new2003);
        new2004 = removeL(new2004);
    
        % add all patts to block
        block = [];
        block = [block; old1001; old1002; old1003; old1004];
        block = [block; new2001; new2002; new2003; new2004];
        
        % sort without repetitions
        k = 0;
        while k == 0
            block = randomizeRows(block);
            if (n==1|isequal(block(1,145), sequence(end,145))==0); k=1; end
        end
        
        block = insertOr(block); % insert T orientation
        block(:,146) = n;        % insert block number
        sequence = [sequence; block];
    
    end
    
    % stage 2
    for n = numBlocks1A+numBlocks1B+1:numBlocks1A+numBlocks1B+numBlocks2
        
        % build new patts

        % para los 301X la Y está en el mismo lado que la T
        % para los 302X la Y está en el lado contrario
        new3011 = makeNewY(Rlocs, 4, 3011, Tlocs(1), tcols(1), 32);
        new3012 = makeNewY(Rlocs, 4, 3012, Tlocs(2), tcols(2), 70);
        new3013 = makeNewY(Rlocs, 4, 3013, Tlocs(3), tcols(3), 32);
        new3014 = makeNewY(Rlocs, 4, 3014, Tlocs(4), tcols(4), 70);
        new3021 = makeNewY(Rlocs, 4, 3021, Tlocs(1), tcols(1), 70);
        new3022 = makeNewY(Rlocs, 4, 3022, Tlocs(2), tcols(2), 32);
        new3023 = makeNewY(Rlocs, 4, 3023, Tlocs(3), tcols(3), 70);
        new3024 = makeNewY(Rlocs, 4, 3024, Tlocs(4), tcols(4), 32);
    
        % add all patts to block
        block = [];        
        block = [block; old1011; old1012; old1013; old1014];
        block = [block; old1021; old1022; old1023; old1024];
        block = [block; new3011; new3012; new3013; new3014];
        block = [block; new3021; new3022; new3023; new3024];
        
        % sort without repetitions
        block = rndY(block, sequence, n, 3);

        block(:,146) = n;        % insert block number
        sequence = [sequence; block];
    
    end
    
    
    function [Y] = randomizeRows(X)
        [numRows, numCols] = size(X);
        indices = randperm(numRows);
        Y = X(indices, :);
    end

    function blck = insertOr(blck)
        for j = 1:size(blck, 1)
            tloc = find(blck(j,:)>200 & blck(j,:)<300);
            blck(j, tloc) = blck(j, tloc) + randi(2)*2;
        end
    end

    function pattsOut = insertY(pattIn, yloc, pattID)
        tloc = find(pattIn>200 & pattIn<300);
        tcol = mod(pattIn(tloc), 100);
        pattsOut = [pattIn; pattIn; pattIn; pattIn];
        pattsOut(1,tloc) = pattIn(tloc) + 2;
        pattsOut(2,tloc) = pattIn(tloc) + 2;
        pattsOut(3,tloc) = pattIn(tloc) + 4;
        pattsOut(4,tloc) = pattIn(tloc) + 4;
        pattsOut(1,yloc) = 300 + tcol + 2;
        pattsOut(2,yloc) = 300 + tcol + 4;
        pattsOut(3,yloc) = 300 + tcol + 2;
        pattsOut(4,yloc) = 300 + tcol + 4;
        pattsOut(:,145) = pattID;
    end

end