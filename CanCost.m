function [Loss] = CanCost(r,h)
%CanCost: calculates the total monetary loss involved with producing 
%one unit, the unit in tis case being a cylindrical can
%includes the cost per unit area, cost per unit volume and unit production
%cost, adds them all up into 1 sum
%in this function, the cost per unit depends on the radius
RadCost = (0.02*(r.^2)) + (0.12 .* r) + 0.35;
%first, find the cost based on the height of the can
Al = .0055 .* CylArea(r,h); 
VolCost =  .0015 .* CylVol(r,h);
Loss = Al + VolCost + RadCost;
%calculate the cost based on the parameters 
end