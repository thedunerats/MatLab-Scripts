function [face] = roll2
%roll2: genertaes a random number 1-6, does not use floor
%function, uses the round function
face = round( rand * (6 - 1) + 1);
end