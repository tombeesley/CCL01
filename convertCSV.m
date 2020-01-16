function convertCSV

for s = 1:20
    
    load(['Raw Data\y046d_subj',int2str(s)]);
    
%     details = DATA.details;
%     exportName = ['CSV Data/' int2str(s) '_details.txt'];
%     fileID = fopen(exportName,'w');
%     fprintf(fileID,'%d %s %s %s %s',details{1:5});
%     fclose(fileID);

    td = DATA.trials;
    exportName = ['CSV Data/' int2str(s) '_td.csv'];
    csvwrite(exportName,td);
    
end