function [Z] = myerfc2(x)
%myerfc2: uses a vectorization approach in order to calculate
%the complementary error function of an input argument
%will compute an operation on a vector of terms and 
%compute the output as a sum of all the elements
%get a range of values for the exponent from input for the input vector
N = [0:10];
%get a new x vector
newx = ((((-1).^(N)) .* (x .^ (2.*(N) + 1)))./(factorial(N) .* (2.*(N) + 1)));
%add up all the elements of the new vector
Summation = sum(newx);
%finalize the calculation
Z = 1 - ((2./sqrt(pi)).* Summation);
end