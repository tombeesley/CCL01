cgflip(0.6, 0.6, 0.6)
pause(0.8) % brief pause before break
cgflip(0, 0, 0) 

for n = 1:breakInterval    
	
    cgpencol(1,1,1);
    cgalign('c','c')
	cgfont('Arial',30);
    cgtext('REST', 0, 50)
	cgfont('Arial', 20);
    cgtext(horzcat('The experiment will continue in ', num2str(breakInterval - (n - 1)), ' seconds.'), 0, -20)
	cgflip (0, 0, 0)
	pause(1)        
    
end

cgfont('Arial',30); cgtext('Press any key to continue.', 0, 50)
cgflip (0, 0, 0)
waitkeydown(inf);

cgflip(0.6, 0.6, 0.6)
pause(0.8) % brief pause after break
