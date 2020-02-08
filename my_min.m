function [MinValue] = my_min(VectorX)
%my_min: takes in a vector and returns the smallest
%entry in the vector
%create a variable to initialize the value the represents the output
%compare first value to every value in the vector, change if indexed
%vector value is smaller
MinValue = VectorX(1);
for k = 1:length(VectorX)
    if MinValue > VectorX(k)
        MinValue = VectorX(k);
    end
end
end