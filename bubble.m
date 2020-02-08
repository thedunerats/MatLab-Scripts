function [C, S] = bubble( x )
% BUBBLE sorts a list contained in an array variable x
% using the bubble (sinking) sort algorithm
C=0;
S=0;
N = length(x);     % number of elements N
for p = 1 : N-1         % N-1 passes needed
    for k = 1 : N-p   
        C=C+1; % 1 less comparison needed each pass, comparison counter
        if x(k+1) < x(k)        % true --> needs to be sorted  
            temp = x(k);        % swap the two elements
            x(k) = x(k+1);      
            x(k+1) = temp;
            S=S+1; %swap counter
           
        end                     % end if
    end
    % end inner for


end                     % end outer for
end  % end function
