function [xM] = new_bisection(fh, xL, xR)
% BISECTION uses bisection method to solve f(x) = 0.
% fh is handle to f(x)
% xL and xR are values of x that bracket solution
% xM returns final estimate of x

n=20; %iteration limit
k=0; %counting variable
tolerance = eps;


%establish first endpoints
low=feval(fh, xL);
high=feval(fh, xR);

%display error if signs(positive or negative) match
if low*high > 0
    disp('Error signs match.');
    xM = 'Error'
end
%use while loop to narrow the limits

while abs(xL-xR) > tolerance & k < n
    k=k+1; %iterate counter
    
    xT=(xL+xR)/2; %find value to test as a root
    midpoint=feval(fh, xT);
    if midpoint==0%if it is a root output the value
        xM=xT; %return found root
    end
    %otherwise update the endpoints
    if low * midpoint > 0
        xL = xT;
        low = midpoint;
    else
        xR = xT;
    end
end
%if root cannot be found in the allotted number of iterations, give the
%best estimate
xM = xT;
end