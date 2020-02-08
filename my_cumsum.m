function [ y ] = my_cumsum( x )
%my_cumsum Returns the cumulative sums of the elements in vector x
%   Output is also a vector
y=zeros(1, length(x)); %initialize output vector
y(1)=x(1);

for k = 1:length(x)-1 %use a for loop to make cumulative sums
    y(k+1)=y(k)+x(k+1);
end

