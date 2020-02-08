function [Gain] = CanPrice(r,h)
%CanPrice: calculates the revenue earned from selling one can
%uses the cylinder voltume function to find this amount based
%on radius and height
Gain = 3.5 .* (1-exp(1.5-.01 .* CylVol(r,h)));
end