function[x] = newt(fh, dfh, x0)
% NEWTON Uses Newton’s method to solve f(x) = 0.
% fh is handle to f(x), dfh is handle to f’(x).
% Initial guess is x0.
% Returns final estimate of x

% Initialize variables for:
% iteration counter
k = 0;
% iteration limit
n = 20;
% previous estimate of x (xold)
xold = x0;
% desired error tolerance
Tolerance = eps;
% current value of relative error
Relerror = 1;
% As long as error is above tolerance and iteration limit not yet reached,
while Relerror > Tolerance && k <= 20
    % increment counter
    k = k + 1;
    % implement Newton equation
    x = xold - (fh(xold)/dfh(xold));
    % calculate relative error
    Relerror = abs((x-xold)/(xold));
    % reset xold to current value
    xold = x;
    % If iteration limit was reached, print error message
    if k == n
        disp('Warning: you have reached your designated limit for iterations.')
    % Display current estimates of x and f(x),
    end
    fprintf('The value of x after %d iterations is %.6f.\n',k,x)
end
end