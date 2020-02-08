function [x] = selection( x )
%this function has been modified to accomodate arrays of strings.
%the lessthan function takes care of the string comparison.
S=0;
C=0;

% SELECTION sorts a list contained in an array variable x
% using the selection sort algorithm

N = length(x);     % number of elements N

for p = 1 : N-1         % N-1 passes needed
    low = p;                % initialize low to element p
    %p is a pivot value, initialized, will change during the loop
    for k = p+1 : N         % 1 less comparison needed each pass
        C=C+1; %comparison counter
        if lessthan(x{k}, x{low})        % if true,...
            low = k;             % ...new low
        end                     % end if
    end                     % end inner for
    temp = x{low};          % swap elements p and low
    x{low} = x{p};
    x{p} = temp;
    S=S+1; %swap counter
    
end                     % end outer for


end  % end function
