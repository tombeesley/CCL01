function showOnScreen(inputPat)
% 1. rearrange vector
% 2. draw the elements in the appropriate coordinates

    inputPat = rearrange(inputPat); %subfunction defined below

    for j = 1:144 % go through all the elements...
        % x and y code for the coordinates of sprites depending on j
        x = -275 + (rem(j-1, 12) * 50); % finds out column        
        y = 275 - floor((j / 12)-0.0001)*50; % finds out row
        cgalign('l','t')
        % each sprite is placed on x, y...
        if inputPat(j) > 0; cgdrawsprite(inputPat(j), x, y); end
    end
    
    function [out] = rearrange(in)
        qA = in(1:36);
        qB = in(37:72);
        qC = in(73:108);
        qD = in(109:144);
        tempVector = [qA(1:6), qB(1:6), qA(7:12), qB(7:12), qA(13:18), qB(13:18), qA(19:24), qB(19:24), qA(25:30), qB(25:30), qA(31:36), qB(31:36)];
        tempVector = [tempVector, qC(1:6), qD(1:6), qC(7:12), qD(7:12), qC(13:18), qD(13:18), qC(19:24), qD(19:24), qC(25:30), qD(25:30), qC(31:36), qD(31:36)];
        out = [tempVector];
    end
    
end