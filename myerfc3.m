function [Z] = myerfc3(x)
%myerfc3: uses an integral from 0 to the input value of 
%e^(-phi^2) 
Handle = @(phi)exp(-1*(phi.^2));
IntegSum = integral(Handle,0,x);
Z = 1 - (2./(sqrt(pi))) .* IntegSum;
end