function [Z] = myerfc1(x)
%myerfc1: approximates the error function of a given input
%This version of the error function uses a series summation to 
%get the value of the function
%it iterates until the sum converges at the smallest possible difference
%the the computer (while loop)
%first: initialize the value for the tolerance
Tolerance = eps;
%initialize the number of iterations in the loop
N = 0;
%initialize a value for the Sum
Summation = 0;
%initialize the value of the additional term, will reset in the loop each
%time
Term = 1;
%begin the loop, while the absolute value of the term is greater than or
%equal to eps
while abs(Term) >= Tolerance
    %get a new value for the term
    Term = ((((-1).^N) .* (x .^ (2*N + 1)))/(factorial(N) .* (2*N + 1)));
    %change the value of the sumation each iteration
    Summation = Summation + Term;
    %increment the number of iterations completed
    N = N + 1;
end
%multiply the summation by 2 over the square root of pi, and subtract from
%1
Z = 1 - ((2/sqrt(pi)) * Summation);
%display the number of iterations needed to complete the loop
fprintf('The series required %d iterations of the loop in order to converge. \n',N)
end