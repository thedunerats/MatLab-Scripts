function [face] = roll
%roll:  simulates rolling a die
%will generate a random integer 1-6 upon calling
face = floor( rand * (6 - 1 + 1) + 1 ); 
end