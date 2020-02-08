function[outarg] = permutate(EncStr,Key)
%permutate: transpose the matrix and, based on the key 
%flip up and down if even and flip left or right if odd
EncStr = dec2bin(EncStr'); %transpose and convert into binary form
if rem(Key,2) ~= 0
    outarg = dec2bin(EncStr,8); %mirror the matrix vertically 
    %if key is even
else    
    outarg = dec2bin(EncStr',8); %mirror horizontally if key is odd
end
end