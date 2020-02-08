function [x, f, conv] = newtfun2(fh, x0)
% NEWTON Uses Newton’s method to solve f(x) = 0.
% fh is handle to f(x), dfh is handle to f’(x).
% Initial guess is x0.
% Returns final value of x, f(x), and
% conv (1 = convergence, 0 = divergence)
k = 0;          % iteration counter
klimit = 20;    % iteration limit
x = x0;         % initialize x to starting guess
re = eps;       % specified relative error tolerance
myrel = 1;      % initialize rel error to large value
%
while myrel > re && (k < klimit)    % loop until rel err or klimit reached
    xold = x;                       % reset previous estimate of root
    x = x - fh(x) / fderiv(fh,x);   % apply Newton formula to get new x
    k = k + 1;                      % increment iteration counter
    myrel = abs((x-xold)/x);        % rel diff between successive estimates
end;
%
if myrel <= re
    conv = 1;   % converged to specified error tolerance
else
    conv = 0;   % did not converge to specified error tolerance
end;
f = fh(x);      % function evaluated at final estimate of x
%
    function outarg = fderiv(fh, x)
        % estimates derivate of function fh evaluated near x
        delta = 0.01;           % small increment
        xL = x * (1 - delta);   % define value to left of x
        xR = x * (1 + delta);   % define value to right of x
        outarg = ( fh(xL) - fh(xR) ) / (xL - xR);   % estimate of deriv
    end


end