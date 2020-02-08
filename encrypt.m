function [ stringout, key ] = encrypt( string )
%encrypt Encrpypts a string and returns the result along with an encryption
%key
%   Detailed explanation goes here
key = randi([1 127]); %integer for encryption key

for k = 1:length(string)
    string(k)=string(k)+key+k;
    while string(k) > 127
        string(k)=string(k)-127;
    end
end

%wrap around from 127 to 1
%mask = string > 127;
%string = string - (mask*127);

stringout = native2unicode(string);