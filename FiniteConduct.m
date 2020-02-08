function [Theta] = FiniteConduct(x,t,a,L)
%FiniteConduct: uses a for loop to calculate the ratio between Tin and Tout
%given four inputs t units of time, variable length of the conductive 
%material x, maximum length L, calculates the temperature ratio Theta
%during heat conduction between Tin and Tout through a material
%
%first: get a number of iterations for the summation series
Nterms = 1000; %this loop will contain 1000 iterations, possibly more
%because the series is infinite
%initialize a value for the sum
Series = 0;
for N = 1:Nterms
    Series = Series + (1/N) .* exp((-a .* t).*((N*pi/L)^2))...
        .* sin(N .* x .* pi ./ L);
end
%multiply the sum of series by -2/pi
Theta = (2/pi) * Series;
%1 - x/L - (current value of theta) = the end result of the function
Theta = 1 - (x ./ L) - Theta;
end