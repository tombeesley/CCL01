function outPatts = makeNewY(Rlocs, numDistr, trialCode, Tloc, Tcol, Yloc)

    newPatt1 = [makePatt(Rlocs,numDistr), trialCode];
    newPatt2 = [makePatt(Rlocs,numDistr), trialCode];
    newPatt3 = [makePatt(Rlocs,numDistr), trialCode];
    newPatt4 = [makePatt(Rlocs,numDistr), trialCode];
    
    newPatt1(Tloc) = 200 + Tcol + 2;
    newPatt2(Tloc) = 200 + Tcol + 2;
    newPatt3(Tloc) = 200 + Tcol + 4;
    newPatt4(Tloc) = 200 + Tcol + 4;
    
    newPatt1(Yloc) = 300 + Tcol + 2;
    newPatt2(Yloc) = 300 + Tcol + 4;
    newPatt3(Yloc) = 300 + Tcol + 2;
    newPatt4(Yloc) = 300 + Tcol + 4;
    
    newPatt1 = removeL(newPatt1);
    newPatt2 = removeL(newPatt2);
    newPatt3 = removeL(newPatt3);
    newPatt4 = removeL(newPatt4);

    outPatts = [newPatt1; newPatt2; newPatt3; newPatt4];

end

