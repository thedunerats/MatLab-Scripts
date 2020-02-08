function [xM] = my_bisection(fh, xL, xR)
% BISECTION uses bisection method to solve f(x) = 0.
% fh is handle to f(x)
% xL and xR are values of x that bracket solution
% xM returns final estimate of x
%initialize number of iterations
k = 0;
%set limit for error Tolerance
Tolerance = eps;
%set limit for number of iterations
n = 20;

%run the first iteration of the loop, checks for certain conditions
x1 = (xL + xR)/2;
xM = x1;
%check that there is actually a zero between the 2 bounds
if (fh(xL) .* fh(xR)) > 0 %no zeros for this condition
    disp('There are no zeros between the given boundaries.')
end
%loop the process by reassigning value of xM
%check if fh(xM) does not equal 0, will repeat until it does

%xM becomes right bound if fh(xM) < 0
%xM becomes the left bound if this condition is false
while fh(xM) ~= 0 || k <= 20
    k = k + 1; %increment k
    if (fh(xL)*fh(xM)) < 0
        xM = xR;
    else
        xM = xL;
    end
    fprintf('f(x) = %.6f after %d iterations. \n',fh(xM),k)
    %get a new midpoint for the next iteration
    xM = (xL + xR)/2;
    if k == 20
        disp('You have reached your limit for iterations.')
    end
end