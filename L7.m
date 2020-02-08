v0 =[10 15 20 25 30]

Tflight = [1.2 1.71 2.26 3.15 3.42; 1.49 2.11 2.81 3.72 4.28; 1.85 2.69 3.42 4.45 5.24]

plot(v0, Tflight(1, :), 'o')

var = interp1(v0, Tflight(1, :), 17, 'linear')
var2 = interp1(v0, Tflight(1, :), 17, 'spline')

plot(v0, Tflight(1, :), 'o', v0, Tflight(2, :), '+',v0, Tflight(3, :), '*')

var3 = interp2(v0, [35 45 60], Tflight, 22, 40)

v0 =[10 15 20 25 30];

Tflight = [1.2 1.71 2.26 3.15 3.42; 1.49 2.11 2.81 3.72 4.28; 1.85 2.69 3.42 4.45 5.24];
plot(v0, Tflight(1, :), 'o', v0, Tflight(2, :), '+',v0, Tflight(3, :), '*')

var3 = interp2(v0, [35 45 60], Tflight, 22, 40)