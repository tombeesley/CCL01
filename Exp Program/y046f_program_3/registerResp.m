function [RespKey, Accuracy, RT] = registerResp(orientation, imgOnTime)
%The orientation of the target in that trial is entered as 2 = right or 4=
%= left. imgOnTime is the moment at which the image was presented.
%The function outputs accuracy = 1 if the response was correct (0
%otherwise) and the RT for that trial.

    [RespKey, RT] = waitkeydown(inf,[26 13]); %wait for Z or M keypress
    
    % determine accuracy of response
    Accuracy = 0;
    if numel(RespKey) == 1 % accuracy = 0 for cases of multiple key presses
        switch RespKey
            case 26 %Z
                if orientation == 4
                    Accuracy = 1;
                end
            case 13 %M
                if orientation == 2
                    Accuracy = 1;
                end
        end
    else
        RespKey = RespKey(1);
        Accuracy = 99; %mark double key press as 99
        RT = RT(1);
    end

    % compute RT
    RT = RT - imgOnTime;
            
end