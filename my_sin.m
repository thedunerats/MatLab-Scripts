function [Total] = my_sin(x,N)
%my_sin: approximates sin x to N iterations
%through series approximation
%x is an input, stays constant for each iteration
%input the number of iterations and then calculate the series
%also display the updated estimate and error for given iterations(each 1)
%first, initialize the total
Total = 0;
for k = 0:N
    Total = Total + (((-1)^k)/(factorial(2*k + 1))) * (x)^(2*k + 1);
    fprintf('Estimate is %.16f after %d iterations.\n',Total,k)
    fprintf('The difference between the %dth iteration and sin x is %.16f\n',k,(sin(x)-Total))
end