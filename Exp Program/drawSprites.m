function drawSprites
%This script creates all the Sprites that will be used in an experiment by
%calling hte BuildSprite function.
%OLD COMENTS: The name of each sprite stands for shape/color/orientation
%1=L, 2=T / 1=red, 2=green, 3=blue, 4=yellow / 1=0, 2=90, 3=180, 4=270
%NEW COMMENTS: I am going to make all BLACK

BuildSprite(111, [0 0 0], [-13 -13 13 -13; -13 13 -13 -13])%Black distractors
BuildSprite(112, [0 0 0], [-13 13 13 13; -13 13 -13 -13])
BuildSprite(113, [0 0 0], [-13 13 13 13; 13 13 13 -13])
BuildSprite(114, [0 0 0], [-13 -13 13 -13; 13 -13 13 13])
BuildSprite(121, [0 0 0], [-13 -13 13 -13; -13 13 -13 -13])
BuildSprite(122, [0 0 0], [-13 13 13 13; -13 13 -13 -13])
BuildSprite(123, [0 0 0], [-13 13 13 13; 13 13 13 -13])
BuildSprite(124, [0 0 0], [-13 -13 13 -13; 13 -13 13 13])
BuildSprite(131, [0 0 0], [-13 -13 13 -13; -13 13 -13 -13])
BuildSprite(132, [0 0 0], [-13 13 13 13; -13 13 -13 -13])
BuildSprite(133, [0 0 0], [-13 13 13 13; 13 13 13 -13])
BuildSprite(134, [0 0 0], [-13 -13 13 -13; 13 -13 13 13])
BuildSprite(141, [0 0 0], [-13 -13 13 -13; -13 13 -13 -13])
BuildSprite(142, [0 0 0], [-13 13 13 13; -13 13 -13 -13])
BuildSprite(143, [0 0 0], [-13 13 13 13; 13 13 13 -13])
BuildSprite(144, [0 0 0], [-13 -13 13 -13; 13 -13 13 13])

BuildSprite(212, [0 0 0], [-13 -13 -13 13; -13 0 13 -0])%Black targets
BuildSprite(214, [0 0 0], [13 -13 13 13; -13 0 13 -0])
BuildSprite(222, [0 0 0], [-13 -13 -13 13; -13 0 13 -0])
BuildSprite(224, [0 0 0], [13 -13 13 13; -13 0 13 -0])
BuildSprite(232, [0 0 0], [-13 -13 -13 13; -13 0 13 -0])
BuildSprite(234, [0 0 0], [13 -13 13 13; -13 0 13 -0])
BuildSprite(242, [0 0 0], [-13 -13 -13 13; -13 0 13 -0])
BuildSprite(244, [0 0 0], [13 -13 13 13; -13 0 13 -0])

% hago los mismos targets con otros nombres para stage 2
BuildSprite(312, [1 0 0], [-13 13 0 0; -13 -13 0 0; 0 0 13 0])%Red targets
BuildSprite(314, [1 0 0], [13 13 0 0; 13 -13 0 0; 0 0 -13 0])
BuildSprite(322, [1 0 0], [-13 13 0 0; -13 -13 0 0; 0 0 13 0])%Green targets
BuildSprite(324, [1 0 0], [13 13 0 0; 13 -13 0 0; 0 0 -13 0])
BuildSprite(332, [1 0 0], [-13 13 0 0; -13 -13 0 0; 0 0 13 0])%Blue targets
BuildSprite(334, [1 0 0], [13 13 0 0; 13 -13 0 0; 0 0 -13 0])
BuildSprite(342, [1 0 0], [-13 13 0 0; -13 -13 0 0; 0 0 13 0])%Yellow targets
BuildSprite(344, [1 0 0], [13 13 0 0; 13 -13 0 0; 0 0 -13 0])

    %----------------------------------------------------------------------
    %                             SUBFUNCTIONS
    %----------------------------------------------------------------------
    
    function BuildSprite(sprN,LineCol,LineArray)
    %This function, created by Tom, draws an sprite with number sprN, color
    %LineCol and with the lines defined in LineArray, an N x 4 matrix where
    %each row represents the origin and end points of a line.
        cgmakesprite(sprN,50,50,0.6,0.6,0.6)
        cgsetsprite(sprN)
        cgpencol(LineCol)
        cgpenwid(3)
        for i = 1:size(LineArray)
            cgdraw(LineArray(i,1),LineArray(i,2),LineArray(i,3),LineArray(i,4))
        end
        cgsetsprite(0)
    end

end