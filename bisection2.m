function [x, f, conv] = bisection2(fh, x0)
% BISECTION Uses bisection method to solve f(x) = 0.
% fh is handle to f(x)
% x0 is an initial guess near root
% Returns final value of x, f evaluated at x, and conv = true if converged
x = x0;     % initialize x to initial guess
% find two values of x near x0 that bracket root
delta = eps;                % start with smallest increment
while fh(x + delta) * fh(x - delta) >= 0    % while root not bracketed
    delta = delta * 10;     % magnify increment
end
xL = x - delta;
xR = x + delta;
%
k = 0;          % iteration counter
klimit = 50;    % iteration limit
re = eps;       % required relative error tolerance
myrel = 1;      % initialize rel error at large value
while (myrel > re) && (k < klimit)  % until rel err or step limit reached
    x = (xL + xR)/2;                % define new midpoint
    myrel = abs((xL-x)/x);          % calculate relative change
    if fh(xL)*fh(x) < 0             % if root between xL and x
        xR = x;                     % move right bracket to midpt
    else                            % otherwise
        xL = x;                     % move left bracket to midpt
    end
    k = k + 1;                      % increment counter
end;
%
if myrel <= re
    conv = 1;   % converged to specified error tolerance
else
    conv = 0;   % did not converge to specified error tolerance
end;
f = fh(x);      % function evaluated at final estimate of x
end