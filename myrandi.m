function [Int] = myrandi(varargin)
%MYRANDI: prints a random integer
%has a variable number of inputs
if nargin == 0 %print integer between 1 and 10
    Int = ceil(10 * rand); %ceil rounds up, ensure that no zeros occur
    %unlike floor
elseif nargin == 1 %print integer between 1 and upperbound (input)
    Int = floor(1 + (varargin{1} - 1 + 1)*rand); %make sure to index the 
    %cell array
elseif nargin == 2 %print integer between both inputs   
    Int = floor(varargin{1} + ((varargin{2} - (varargin{1} + 1)) * rand));
    %remember: varargin is a cell array, so curly braces are needed
    %add lower bound plus the difference between the 2 bounds
    %times a random number
else %give an errror message for anything else
    disp('Error: the function can only accept 0, 1, or 2 inputs.') 
end %end if
end %end function