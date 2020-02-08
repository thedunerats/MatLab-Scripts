function [ outstr ] = addspaces( ciphertext, spaceindex )
%addspaces add spaces to string based on index vector
%   Detailed explanation goes here
newtext = 'a';
for i = 1:length(ciphertext) %iterate through string, reconcatenating it one character at a time
    if sum(i == spaceindex)
        if i == 1
            newtext = ' ';
        else
            newtext = [newtext, ' '];
        end
    end
    if i == i && newtext ~= ' '
        newtext = ciphertext(i);
    else
        newtext=[newtext, ciphertext(i)];
    end
end
        
outstr = newtext;
end

