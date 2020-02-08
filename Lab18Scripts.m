%Lab 18 Scripts

%Problem 1
%creation of myerf1
%and also myerf2 and myerf3

%NOTE: this program will not work very well unless 
%the value of L is very small.

%problem 2: the InfConduct Function
%main program
%first: input realistic values for the following parameters of 
%the material alumina (Al2O3)
k = 18; %thermal conductivity
Cp = 880; %specific heat
rho = 3690; %density
%then use them to get the value of thermal diffusivity alpha
alpha = (k/(rho*Cp));
%specify the values of Tin to Tout
TempVec = linspace(50,60,10);
%also specify Tin and Tout
Tin = max(TempVec);
Tout = min(TempVec);
%specify L
L = linspace(0,.1,10);
%set time equal to 100s
Time = 100 .* ones(1,length(TempVec));
%calculate T from all the parameters
T = InfConduct(L,Time,alpha)
%plot T over x from 0 to L
plot(L,T)
%pause(.5) pauses the program every .5 seconds.
pause(0.5);
%label the graph
title('Heat Current Over Time bassed on the Complementary Error Function')
xlabel('Length (m)')
ylabel('Fractional Temperature Ratio: Tin / Tout (Theta)')

%problem 3
%designing an finite heat conduction model for x > L

%note: this program will use 1000 iterations of a for loop.
%get initial values and inputs for the FiniteConduct Function
k = 18; %thermal conductivity
Cp = 880; %specific heat
rho = 3690; %density
%then use them to get the value of thermal diffusivity alpha
alpha = (k/(rho*Cp));
%specify the values of Tin to Tout
TempVec = linspace(50,60,1000);
%also specify Tin and Tout
Tin = max(TempVec);
Tout = min(TempVec);
%specify x
x = linspace(0,.1,1000);
%specify L
L = 0.1;
%set time equal to 100s
Time = 100;
%input x, t, alpha and length into the function FiniteConduct
T = FiniteConduct(x,Time,alpha,L);

%plot T over x
plot(x,T)
%label the graph
title('Heat Current Over Time based on Infinite Summation')
xlabel('Length (m)')
ylabel('Fractional Temperature Ratio: Tin / Tout (Theta)')
pause(.5);

%problem 4: comparing the accuracy of the two functions
%compare finite conduct and infinite conduct at different values of t(time)

%use the same initial guess for both functions, will both use the 
%same inputs
%note: this program will use 1000 iterations of a for loop.
%get initial values and inputs for the FiniteConduct Function
k = 18; %thermal conductivity
Cp = 880; %specific heat
rho = 3690; %density
%then use them to get the value of thermal diffusivity alpha
alpha = (k/(rho*Cp));
%specify the values of Tin to Tout
TempVec = linspace(50,60,1000);
%also specify Tin and Tout
Tin = max(TempVec);
Tout = min(TempVec);
%specify x
x = linspace(0,.1,1000);
%specify L
L = 0.1;
%set time equal to 100s
Time = 100;

%repeat program with different values for t(try a vector)
TimeVec = [50:50:250]; %replace time variable with this vector

%call both functions for T, set them equal to different variables
TFin = FiniteConduct(x,Time,alpha,L);
TInf = InfConduct(x,Time,alpha);

%plot both functions on the same graph
plot(x,TFin,x,TInf)
%add a legend designating both functions
legend('Finite Conduction Model','Infinite Conduction Model')
%label the graph
title('Heat Current Over Time based on Infinite Summation')
xlabel('Length (m)')
ylabel('Fractional Temperature Ratio: Tin / Tout (Theta)')
pause(.5);

%steady-state response:
%input a bunch of time values into FiniteConduct
TFin1 = FiniteConduct(x,50,alpha,L);
TFin2 = FiniteConduct(x,75,alpha,L);
TFin3 = FiniteConduct(x,100,alpha,L);
TFin4 = FiniteConduct(x,125,alpha,L);
TFin5 = FiniteConduct(x,150,alpha,L);
TFin6 = FiniteConduct(x,175,alpha,L);
TFin7 = FiniteConduct(x,500,alpha,L);

%Plot them all at the same time
plot(x,TFin1,x,TFin2,x,TFin3,x,TFin4,x,TFin5,x,TFin6,x,TFin7)
%label the graph
title('Heat Current Over Time based on Infinite Summation for varying time values')
xlabel('Length (m)')
ylabel('Fractional Temperature Ratio: Tin / Tout (Theta)')
pause(.5);

%problem 5:
%first: define a function handle, make one out of InfConduct
f = @(x,t,a)InfConduct(x,t,a);
%initialize another function handle for the finite conduction model
g = @(x,t,a,l)FiniteConduct(x,t,a,l);
%specify a value for length L(really small, same as earlier)
L = 0.1;
%specify x, is a constant in this loop
x = L; %contains 100 iterations
%get initial values and inputs for the FiniteConduct Function
k = 18; %thermal conductivity
Cp = 880; %specific heat
rho = 3690; %density
%then use them to get the value of thermal diffusivity alpha
alpha = (k/(rho*Cp));
%initialize a value of t so that loop will begin properly
t = 0; 

%begin a while loop to find the value of t 
%where theta is greater than zero, we will calculate at
%x = L
%put inside another while loop that doesnt terminate until theta at
%L/2 of Finite conduct model approaches the steady state model within
%a reasonable approximation
while f(L,t,alpha) <= .001 %increment values of t until deviation occurs
    t = t + 1; %increment t
end
%display the value of t where the infinite conduction model diverges at 
%x = L
fprintf('The Infinite Conduction Model Diverges at t = %d.\n',t)
%begin the second loop
while g(L/2,t,alpha,L) <= 0.4995
    t = t + 1; %increment t each time
end
%display the value of t at this time
fprintf('The Finite Conduction Model Diverges at t = %d.\n',t)