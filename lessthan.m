function [ isless ] = lessthan( a,b )
%lessthan returns logical true if item a is less than item b, and logical false otherwise.
%   Works with numbers or characters

%Check if items are numbers or strings
if ischar(a) && ischar(b)
    %convert both strings to lowercase
    a=lower(a);
    b=lower(b);
    %determine which string comes first alphabetically (numberic value of
    %the character will be smaller)
    k=1;
    while a(k)==b(k) && k < min([length(a), length(b)]) %iterates through
        %length of the shorter string, a final result terminates the loop
        %when 1 of elements is different from the other
        %or when 1 of the strings terminates (the shorter one)
        k=k+1; %increment k
    end
    if a(k) < b(k) %at most this should be the last char in the shorter string
        isless = 1;
    elseif a(k)==b(k) && length(a) < length(b) %'rain' comes before 'rainforest'
        isless = 1;
    else
        isless = 0; %anything that does not apply to any of the previous 
        %categories
    end
    
elseif isnumeric(a) && isnumeric(b) %yes this works with arrays of numbers!
    isless = (a < b);
else %if a and b can't be compared return false
    isless = 0;
end