Values = load('sphere.dat');
SRadius = Values(:,1)';
SVRsphere = Values(:,4)';
plot(SRadius,SVRsphere)
title('Correlation between Surface Area to Volume Ratio and Sphere Radius')
xlabel('Radius of the Sphere')
ylabel('Surface Area over Volume Ratio')