function [SortedList] = MyQuicksort(A)
%NOTE: THIS FUNCTION DOES NOT WORK!
%MyQuicksort: uses recursion to sort a list of numbers, A is an array 
%indexes first item in the list as the pivot value
%creates 3 arrays: 1 with values smaller than pivot
%1 with values larger than pivot
%and 1 with values equal to pivot
%function concatenates all 3 arrays together at the end as output
%remember to establish both a general case and base case
%base case: first element is the smallest element in the list
%and the elements are in ascending order
for k = 1:(length(A)-1) %run through all the elements
    if  A(k+1) >= A(k)
        SortedList = A; %all elements in ascending order
    elseif all(A(A == A(1))) %if all the elements are the same
        SortedList = A; %leave it unchanged
        %general case
    else
        Pivot = A(1); %set the pivot value
        %now recursively redefine the sorted list
        %do this by reconcatenating the 3 recursively defined arrays
        LessThan = MyQuicksort(A(A < Pivot));
        EqualTo = MyQuicksort(A(A == Pivot));
        GreaterThan = MyQuicksort(A(A > Pivot));
        %reconcatenate the array every time
        SortedList = MyQuicksort([LessThan,EqualTo,GreaterThan]);
        %be sure to put parentheses around array
    end
end
end