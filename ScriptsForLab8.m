%Lab 8 scripts

%Problem 1:
% Define the constant parameters Theta = pi / 6  and  g = 9.81;
theta = pi/6;
g = 9.81;

% Define the independent variable V0 to have values 1, 2, 3, …, up to 10;
V0 = [1:10];
% Use equation (2) above to generate corresponding values for the variable xmax;
XMax = ((2/g) * sin(theta)*cos(theta))*(V0.^2)+0;

% Create (and label) a plot of xmax versus V0 (use symbols for the data points).
plot(V0,XMax, '*')
title('Maximum X Value over Initial Velocity Squared')
xlabel('Initial Velocity Squared')
ylabel('Maximum X Value')

% Use the command figure(2) so that calling linfit below will not overwrite the plot above.
figure(2);

% Use the mapping above to define new linearized variables: y = xmax and x = V0 .^ 2.
y = XMax;
x = V0.^2;
% Call the linfit function using x and y as input arguments, and assign the output to a variable LinParams.   
LinParams = linfit(x,y)

% Display the values of m and b by referring to the correct elements of LinParams. 
%(Remember that linfit returns a 1 x 2 vector containing the parameters m and b from the fit.)
fprintf('m = %f \n', LinParams(1))
fprintf('b = %f \n', LinParams(2))
% Label the axes of the linfit plot appropriately 
% in terms of the true variables (xmax and V02); 
title('Linear Regression of Maximum X value over Initial Velocity Squared')
xlabel('v0^2')
ylabel('xmax')

%solve for g based on the value of m from regression
M = LinParams(1);
ExperimentalG = (2/M)*sin(theta)*cos(theta);
fprintf('G = %.f \n',ExperimentalG)

%Problem 2:
%v = p*exp(u*q)

% Create vectors utest and vtest
% Save for later for a comparison plot
utest = [0:5];
vtest = 3*(exp(2*utest));

% Linearize utest and vtest in terms of x and y
x = utest;
y = log(vtest);

% Create a model x vector with enough point for a smooth curve
umodel = linspace(0,5,100);

% Perform linear regression on x and y and plot the linearized function
LinParams = linfit(x,y)
% Print the data from the linfit function
fprintf('m = %f \n', LinParams(1))
fprintf('b = %f \n', LinParams(2))
fprintf('p = %f \n', exp(LinParams(2)))
title('Linear Regression of an Exponential Function')

% Create a vomdel vector from the output of the linfit function and the
% model x vector
vmodel = exp(LinParams(2))*exp(LinParams(1)*umodel); 
% Open a new figure window
figure(2);
% Plot test vectors and model curve on the same plot
plot(utest,vtest,'*',umodel,vmodel,'r')
% Title and label the axes
title('y = 3exp(2x): Test Vector and Model Curve')
xlabel('X')
ylabel('Y')

%Problem 3
%I = I0*e^(-t/Tau)
%first, load data from the text file (RLData.txt)

load RLData.txt;

% Assign Data into 2 different vectors
Time = RLData(:,1);
Current = RLData(:,2);

% Linearlize the equation i = i0 * exp(-t/tau) and the data
XLinear = Time;
YLinear = log(Current);

%Perform Linear Regression on the linearized data, also store data
LinParams3 = linfit(XLinear,YLinear)
title('Linear Regression of Current Over Time in an Inductor')
%write time constant tau and the initial current based on m and b
%from linear regression
InitialCurrent = exp(LinParams3(2));
Tau = (-1/(LinParams3(1)));
%print tau and initial current
fprintf('The initial current is %.f \n', InitialCurrent)
fprintf('The time constant is %.f \n', Tau)

%Create a Y Vector that repesents the model exponential function
YModelExp = (InitialCurrent)*exp(-XLinear/Tau);
%Switch to a new plot window
figure(2);
%plot the Model Y Vector over the model X vector
plot(XLinear,YModelExp,'-')
title('Model Current Function of an RL Circuit: I = I0*exp(-t/Tau)')
xlabel('Time(s)')
ylabel('Current(A)')
%interpolate the data
NaturalResponse = InitialCurrent*exp(-60/Tau);
Guess1 = interp1(XLinear,YModelExp,60);
Guess2 = spline(XLinear,YModelExp,60);
%print the interpolated data
fprintf('The current at t = 60s, based on the natural response model, is %.4f A. \n',NaturalResponse)
fprintf('The current at t = 60s, based on linear interpolation, is %.4f A. \n',Guess1)
fprintf('The current at t = 60s, based on spline interpolation, is %.4f A. \n',Guess2)