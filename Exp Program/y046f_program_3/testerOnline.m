
cgpenwid(1)

cgpencol(0.75, 0.75, 0.75)
cgdraw(-150, -150, -150, 150)
cgdraw(-150, -150, 150, -150)
cgdraw(150, 150, -150, 150)
cgdraw(150, 150, 150, -150)
cgdraw(-300, 0, 300, 0)
cgdraw(0,300, 0, -300)

cgfont('Arial', 20)
cgalign('c', 'c')
cgellipse(-75, 225, 60, 60)
cgtext('11', -75, 225)
cgellipse(-125, 225, 60, 60)
cgtext('10', -125, 225)
cgellipse(-175, 175, 60, 60)
cgtext('15', -175, 175)
cgellipse(-225, 125, 60, 60)
cgtext('20', -225, 125)
cgellipse(-225, 75, 60, 60)
cgtext('26', -225, 75)
cgellipse(75, 225, 60, 60)
cgtext('44', 75, 225)
cgellipse(125, 225, 60, 60)
cgtext('45', 125, 225)
cgellipse(175, 175, 60, 60)
cgtext('52', 175, 175)
cgellipse(225, 125, 60, 60)
cgtext('59', 225, 125)
cgellipse(225, 75, 60, 60)
cgtext('65', 225, 75)
cgellipse(-75, -225, 60, 60)
cgtext('101', -75, -225)
cgellipse(-125, -225, 60, 60)
cgtext('100', -125, -225)
cgellipse(-175, -175, 60, 60)
cgtext('93', -175, -175)
cgellipse(-225, -125, 60, 60)
cgtext('86', -225, -125)
cgellipse(-225, -75, 60, 60)
cgtext('80', -225, -75)
cgellipse(75, -225, 60, 60)
cgtext('134', 75, -225)
cgellipse(125, -225, 60, 60)
cgtext('135', 125, -225)
cgellipse(175, -175, 60, 60)
cgtext('130', 175, -175)
cgellipse(225, -125, 60, 60)
cgtext('125', 225, -125)
cgellipse(225, -75, 60, 60)
cgtext('119', 225, -75)

cgdraw(310, 80, 310, -80)  
cgalign('l', 't')
cgfont('Arial', 16)
cgtext(strcat('Trial: ', int2str(trial)), 320, 60) 
cgtext(strcat('Block: ', int2str(DATA.sequence(trial, 146))), 320, 40)
cgtext(strcat('Type: ', int2str(DATA.sequence(trial, 145))), 320, 20) 
cgtext(strcat('TLoc: ', int2str(Tloc)), 320, 0) 
cgtext(strcat('Tid: ', int2str(Tid)), 320, -20) 
cgtext(strcat('TOrient: ', int2str(Torient)), 320, -40)
  