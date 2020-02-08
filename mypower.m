function [FinalAnswer] = mypower(a,n)
%mypower:  takes the number a and uses recursion to return a^n
%you must write this function without using an exponent symbol
%first: establish a base case (nargout/a) = n
%does not work for negative exponents (well, not yet)
if n == 0 %completion of the recursion sequence
    FinalAnswer = 1;
    disp('Base case reached.') %checks to ensure base case is reached
elseif n > 0 %general case
    fprintf('Approaching N = %d.\n',n) %checks every iteration
    FinalAnswer = a * mypower(a,n-1);
elseif n < 0 %negative powers of n
    fprintf('Approaching N = %d.\n',n) %checks every iteration
    FinalAnswer = (1/a) * mypower(a,n+1); %make sure to 
    %increment n the other direction
    %Note: it actually works
end