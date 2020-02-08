tflight = [1.2 1.71 2.26 3.15 3.42];
V0=[10 15 20 25 30];
regdata=linfit(V0, tflight)
title('Line of Best Fit: Projectile Morion at Theta = 35')
xlabel('Initial Velocity (meters/second)')
ylabel('Flight Time (seconds)')

%add title and axis labels
%create experimental value for g
experimentalG=(sum(V0)/sum(tflight))*2*sind(35)

%calculate accuracy of y intercept 'b'
accuracy=abs((regdata(2)-0)/mean(tflight))