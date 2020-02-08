function[outarg1,outarg2] = lowercase(NoSpaceString)
%lowercase: accepts a string and  returns the same string with no caps
%and a matrix with the indeces of the capital letters
%make sure that you use a 1 x 2 matrix to output both arguments
outarg1 = NoSpaceString; %initialize output argument #1
for k = 1:length(NoSpaceString)
    if (double(NoSpaceString(k)) > 64) && (double(NoSpaceString(k)) < 91)
        outarg1(k) = NoSpaceString(k) + 32;
    end
end
Index = ((NoSpaceString >= 65) & (NoSpaceString < 90));
outarg2 = find(Index > 0);
end