function [ outarg ] = assemble( plaintext, spaceindex, capsindex )
%assemble Combines two index vectors and a string for encryption purposes
%   Detailed explanation goes here

%create first section of output
a=num2str(spaceindex);
a=strrep(a, ' ', 'B');
a=[a 'B'];

%create next section of output
b=plaintext;

%create last section of output
c=num2str(capsindex);
c=strrep(c, ' ', 'C');
c=['C' c];

%assemble output
outarg=[a b c];
end