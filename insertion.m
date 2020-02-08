function [C, S] = insertion( x )
% INSERTION sorts a list contained in an array variable x
% using the insertion sort algorithm
S=0; %initialize comparison and swap countersu
C=0;
N = length(x);      % number of elements N

for p = 1 : N-1         % N-1 passes needed
    k = p+1;                % initialize k to next unsorted element

    % check for correct location of element k in sorted subarray
    while k>1  &&  x(k) < x(k-1)    % still needs to move "up" list
        C=C+1;
        temp = x(k);                % swap elements
        x(k) = x(k-1);
        x(k-1) = temp;
        k = k - 1;        
        S=S+1;% decrement position k of element
    end                     % end inner while

end                     % end outer for

end  % end function
