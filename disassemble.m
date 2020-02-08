function [plaintext,spaceindex,capsindex] = disassemble(AssembledMat)
%disassemble: undoes the assemble function

%get index values for the capital Bs and Cs in the input
LowerBound = find(AssembledMat == 'B');
UpperBound = find(AssembledMat == 'C');

%the largest value in B and the smallest value in C are the bounds
%for the message
%get the boundaries for the actual message
MiddleString = AssembledMat((max(LowerBound) + 1):double(min(UpperBound) - 1));

%eliminate all capital Bs
%first, pull the B matrix out of the input
LowerString = AssembledMat(1:max(LowerBound));
LowerString = strrep(LowerString,'B',' ');%eliminate the capital B integer
%values, replace with blank spaces
LowerString = str2num(LowerString); %convert all entries to numbers
%in the form of a double

%eliminate all capital Cs
%form the lower bound vector
UpperString = AssembledMat(min(UpperBound):length(AssembledMat));
UpperString = strrep(UpperString,'C',' '); %eliminates Cs and replace
%with blankspaces
%change the string to a double
UpperString = str2num(UpperString);

%separate 3 different outputs
spaceindex = LowerString;
capsindex = UpperString;
plaintext = MiddleString;
end