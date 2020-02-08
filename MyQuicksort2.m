function [SortedList] = MyQuicksort2(A)
%MYQUICKSORT custom made quicksort algorithm
%uses recursion to sort a list of numbers, A is an array 
%indexes first item in the list as the pivot value
%creates 3 arrays: 1 with values smaller than pivot
%1 with values larger than pivot
%and 1 with values equal to pivot
%function concatenates all 3 arrays together at the end as output
%remember to establish both a general case and base case
%base case: length of A = 1
%overall: the function stops when the SortedList becomes a concatention
%of 10 different 1-element vectors all in ascending order
%the base case will be true for all of them
if length(A) <= 1 %no change if all the conditions are met
    SortedList = A;
elseif all(A == A(1)) %if all elements are the same value
    SortedList = A;
else
    Pivot = A(1); %redefine pivot variable
    %Split the array into 3 arrays and concatenate all in one line
    %be asure to do the quicksorting function for each of the 
    %newly formed vectors inside the output array
    SortedList = [MyQuicksort2(A(A < Pivot)),... 
        MyQuicksort2(A(A == Pivot)),... 
        MyQuicksort2(A(A > Pivot))];
end
end