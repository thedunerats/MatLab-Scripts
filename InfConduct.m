function [Theta] = InfConduct(x,t,alpha)
%InfConduct: a semi-infinite heat conduction model 
%outputs the dimensionless temperature 
%from the inputs of x, t and theta
%will be used in later calculations
Theta = erfc(x ./sqrt(4 .* alpha .* t));
end