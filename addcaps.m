function [ outstr ] = addcaps( instr, capsindex )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here


for i  = 1:length(instr)
    if sum(i == capsindex)
        instr(i)=instr(i)-32;
    end
end
outstr=native2unicode(instr);

end

