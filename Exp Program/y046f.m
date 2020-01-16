

clear all

app_home = cd;
cd(app_home);
cogentfilepath1 = strcat('D:\Beesley_Lab_experiments\Josh_Hodges\y046f_program_3\Cogent2000v1.32\Toolbox');
cogentfilepath2 = strcat('D:\Beesley_Lab_experiments\Josh_Hodges\y046f_program_3\Cogent2000v1.32');
cogentfilepath3 = strcat('D:\Beesley_Lab_experiments\Josh_Hodges\y046f_program_3\Cogent2000v1.32\Samples');
cogentfilepath4 = strcat('D:\Beesley_Lab_experiments\Josh_Hodges\y046f_program_3\Cogent2000v1.32\Documents');
addpath(cogentfilepath1)
addpath(cogentfilepath2)
addpath(cogentfilepath3)
addpath(cogentfilepath4)

% general variables
testingSoftware = 0;
fixationInterval = 1;
rsInterval = 1; % in secs
fbackInterval = 2; %in secs
breakInterval = 20;
numBlocks1A = 9; %36; 
numBlocks1B = 3; %12;
numBlocks2 = 1; %4;
restBreaks = (100:100:5000);

%times are 25% long if the testing mode is on
if testingSoftware == 1
    fixationInterval = fixationInterval / 5;
    rsInterval = rsInterval / 5;
    fbackInterval = fbackInterval / 5;
    breakInterval = breakInterval / 5;
end

% % collect participant info
DATA.subject = input('Subject number ---> ');
DATA.age = input('Subject age ---> ');
DATA.sex = input('Subject gender (M/F) ---> ', 's' );
DATA.hand = input('Subject hand (R/L) ---> ','s');
DATA.date_s1 = datestr(now,0);
DATA.trials = [];
rand(DATA.subject); % for randomization

% start cogent
config_display(1,5,[0 0 0],[1 1 1],'Helvetica',16,4,0); %IMPORTANT on your PC, change screen resolution to 1280x1024
config_sound;
config_keyboard(100,1,'nonexclusive');
start_cogent;

% create sprites, Tlocs, and patterns,
drawSprites
[Tlocs, Rlocs] = chooseTlocs;
DATA.sequence = makeSeq(Tlocs, Rlocs, numBlocks1A, numBlocks1B, numBlocks2);
numTrials1A = sum(DATA.sequence(:,146) <= numBlocks1A);
numTrials1A1B = sum(DATA.sequence(:,146) <= numBlocks1A + numBlocks1B);

%instructions
for n = 1:5
    instr = strcat('instr', int2str(n), '.jpg');
    loadpict(instr, 1);
    drawpict(1);
    waitkeydown(inf, 71); % wait for spacebar
    cgflip(0.6, 0.6, 0.6)
end


% trials
for trial = 1:size(DATA.sequence, 1)
    
    % rest break?
    if any(restBreaks == trial - 1); restBreak; end
    
    %instructions
    if trial == numTrials1A1B + 1
        cgalign('c','c')
        cgflip(0.6, 0.6, 0.6)
        for n = 6:10
            instr = strcat('instr', int2str(n), '.jpg');
            loadpict(instr, 1);
            drawpict(1);
            waitkeydown(inf, 71); % wait for spacebar
            cgflip(0.6, 0.6, 0.6)
        end
    end

    % inter-trial interval
    cgflip(.6, .6, .6)
    pause(rsInterval)
    
    % fixation cross
    cgflip(.6, .6, .6)
    cgpencol(0, 0, 0); cgpenwid(2); cgalign('c','c')
    cgdraw(0, -10, 0, 10); cgdraw(10, 0, -10, 0)
    cgflip(.6, .6, .6)
    pause(fixationInterval)
    cgflip(.6, .6, .6)

    % draw pattern sprites, save Tloc, Torient and Tid
	showOnScreen(DATA.sequence(trial, 1:144));
    Tloc = find(DATA.sequence(trial,1:144)>200 & DATA.sequence(trial,1:144)<300);
    Yloc = find(DATA.sequence(trial,1:144)>300 & DATA.sequence(trial,1:144)<400);
    Tid = DATA.sequence(trial, Tloc);
    Yid = DATA.sequence(trial, Yloc);
    if isempty(Yloc); Yloc=0; Yid=0; Yorient=0; end
    Torient = rem(Tid, 10);
    Yorient = rem(Yid, 10);
    Rorient = Yorient;
    if Rorient==0; Rorient=Torient; end
    
    % just for testing the program
    if testingSoftware == 1; testerOnline; end
    
    % put image on screen and store timestamp
    cgflip(0.6,0.6,0.6) 
    imgOnTime = time;

    % process response and save data
    [responseKey, accuracy, RT] = registerResp(Rorient, imgOnTime);
    trialData = [trial, DATA.sequence(trial, 145:146), Tloc, Tid, Torient, Yid, Yorient, responseKey, accuracy, RT];
    DATA.trials = [DATA.trials; trialData];
    save(strcat('y046d_subj', (int2str(DATA.subject))),'DATA'); %save DATA structure
    
    % feedback for wrong responses
    if accuracy ~= 1
        cgflip(.6, .6, .6); cgpencol(1,0,0); cgalign('c','c')
        cgfont('Arial',50); cgtext('WRONG!', 0, 0)
        cgflip(.6, .6, .6)
        pause(fbackInterval)
    end
    
end

%END SCREEN
cgflip(0, 0, 0)    
cgpencol(1,1,1); cgalign('c','c')
cgfont('Arial',30); cgtext('END OF THE EXPERIMENT', 0, 70)
cgfont('Arial',22); cgtext('Press ESC to exit', 0, -10)
cgflip
waitkeydown(inf, 52) % wait until ESC pressed
stop_cogent