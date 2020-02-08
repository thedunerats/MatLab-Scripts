function [ outstr ] = decrypt( cipher, key )
%UNTITLED7 Summary of this function goes here
%Detailed explanation goes here
cipher = unicode2native(cipher);
for k = 1:length(cipher)
    cipher(k)=cipher(k)-key-k;
    while cipher(k) < 1
        cipher(k)=cipher(k)+127;
    end
end

outstr = native2unicode(cipher);
end