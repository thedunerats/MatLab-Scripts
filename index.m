function [J] = index( x )
%initialize both a swap and a comparison counter
S=0;
C=0;

% INDEX sorts a list contained in an array variable x and returns an index
% vector using the selection sort algorithm
%indexes the elements in ascending order, indeces of elements
%but the indeces will NOT be in ascending order
N = length(x);     % number of elements N
J = 1:length(x);     %index array

for p = 1 : N-1         % N-1 passes needed
    low = p;                % initialize low to element p

    for k = p+1 : N         % 1 less comparison needed each pass
        C=C+1;
        if x(J(k)) < x(J(low))        % if true,...
            low = k;             % ...new low
        end                     % end if
    end                     % end inner for
    temp = J(low);          % swap elements p and low after each pass
    J(low) = J(p); %reindex the specific element of the vector
    J(p) = temp; %the index becomes the new pivot value
    S=S+1; %increment the swap counter
    
end                     % end outer for
end  % end function