function [Sum] = my_pi(N)
%my_pi: calculates pi by series approximation
%alternating series: every even numbered term changes signs (k = 2,4...)
%will approximate pi to N iterations
%set inital value of total
Total = 0;
%approximate using summation format
%include an if statement, generate result every 10th iteration
%check by using a remainder
for k = 0:N
    Total = Total + (((-1)^k)/(2*k + 1));
    if rem(k,10) == 0
        fprintf('Estimate is %.16f after %d iterations.\n',Total,k)
        fprintf('The difference between the %dth iteration and pi is %.16f\n',k,(pi-(4*Total)))
    end
end
%Sum is 4 times total generated by loop
Sum = 4 * Total;
end