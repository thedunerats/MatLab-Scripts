function [ outarg1, outarg2 ] = blankout( plaintext )
%accepts as input the string variable containing the plaintext message, and 
%outputs two variables—one containing the message with its blank spaces removed, 
%and one containing the former index locations of the spaces.
%   outarg 1 has blank spaces removed, outarg2 contains index locations

outarg1=plaintext(plaintext~=' '); %remove spaces for first string

outarg2=find(plaintext==' '); %index spaces for second string

end

