function [Tlocs, Rlocs] = chooseTlocs
        
    Tlocs = [20 58 80 118];
    
    % quito también los que están entre la Y y la T
    RlocsQ1 = [6 12 18 24 30 31:36 26];
    RlocsQ2 = [42 48 54 60 66 67:72 64];
    RlocsQ3 = [78 84 90 96 102 103:108 74];
    RlocsQ4 = [114 120 126 132 138 139:144 112];

    % a diferencia del anterior, meto Tlocs dentro de Rlocs
    Rlocs = [RlocsQ1, RlocsQ2, RlocsQ3, RlocsQ4, Tlocs];

end