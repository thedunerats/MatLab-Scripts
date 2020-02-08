function [side3] = thirdside(a,b,angleab)
%thirdside: performs the law of cosines
%finds the third side of a triangle given
%2 sides and the angle between them
side3 = sqrt((a)^2 + (b)^2 - 2*a*b*cosd(angleab));
end