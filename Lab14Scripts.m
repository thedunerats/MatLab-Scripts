%Lab 14 Scripts
%model function

% GrowthA.m     Population growth model using Euler method
 
% specify parameters for model
r = 0.5;            % growth rate: # offspring per individual per hour
ti = 0;             % initial time for analysis in hours
tf = 10;            % final time for analysis in hours
tsteps = 5;         % integer number of time steps
N0 = 1;             % initial population in thousands

% create arrays for time t and population N
h = (tf - ti) / tsteps;             % time step (dt) in hours
t = linspace(ti, tf, tsteps+1);     % create array of time points
N = zeros(1, tsteps+1);             % pre-allocate array for population
N(1) = N0;                          % put initial population into N(1)
 
% apply iterative Euler algorithm to step from t0 to tf
for k = 1 : tsteps                  % for each time step of length h
    N(k+1) = N(k) + r * h * N(k);   % update new population from previous
end
 
% output results
disp('        t(hr)          N')
disp([t' N'])
% plot Euler 
plot(t, N)
title('Population Growth Model')
xlabel( 'Hours' ), ylabel( 'Population' )

%problem 1
%(a)	Write a script that uses Euler’s method to solve the natural response differential equation (5) for I(t) from t = 0 to t = 1 sec.  
%Assume that the initial current I0 = 2 A, the resistance R = 20 ohms, and the inductance L = 3 H.  
%Start out with 10 time steps (0.1 sec time step) for the numerical solution, and create a plot of current versus time.
%(dI/dt) = -(R/L)*I

%initialize a value for current, resistance and inductance
I0 = 2;
L = 3;
R = 20;
%use inductance and Resistance to set a value for tau
Tau = L/R;
%set a number of interations
tsteps = 50;
%set intial and final values for time
ti = 0;
tf = 1;
%set increment h for spacing on the x axis
h = (tf-ti)/(tsteps);
%create an array of time points
Tvec = linspace(ti,tf,tsteps+1);
%allocate an empty array for the current
IEvec = zeros(1,tsteps+1);
%place the first value of current into the first element of the empty
%vector
IEvec(1) = I0;

%predictor corrector method:
%create a new zero vector for this method identitcal to one set for Euler
%method, also create an identical one for predictor-corrector method
ICvec = zeros(1,tsteps+1);
ICvec(1) = I0;

%apply iterative Euler method to solve the natural response ODE
%by solving for I(sub: K +1)
%also include the predictor corrector method in this loop
for k = 1:tsteps
    IEvec(k+1) = h*(-R/L)*(IEvec(k)) + IEvec(k); %update values each iteration
    IPvec = ICvec(k) + h*(-R/L)*(ICvec(k)); %estimate new current from old
    ICvec(k+1) = ICvec(k) + h*(-R/L)*((ICvec(k) + IPvec)/2); %update new current from average
end

%(part b): exact solution to the ODE
%I = I0e^(-t/tau)
Iexact = I0*exp(-Tvec ./ Tau);

%display a table of the columns
%includes Tvec,Ivec,Iexact
disp('Tvec    IEvec      ICvec      Iexact')
disp([Tvec' IEvec' ICvec' Iexact'])

%plot the graph of current over time, %also include the graph of the exact 
%solution and the predictor-corrector method
plot(Tvec,IEvec,Tvec,Iexact,Tvec,ICvec)
legend('Euler Method','Exact Plot','Predictor-Corrector Method')
title('Euler Method: RL Circuit Decay Model')
xlabel('Time(seconds)')
ylabel('Current(Amperes)')

%(b)	The exact solution to this differential equation is given by equation (6).  
%Add statements to your program to calculate this exact current and compare it to your 
%Euler approximation both by printing a table of values (columns for time, Euler, and exact values) 
%and by creating a plot of the two solutions on the same graph (include a
%legend). (done)

%(c)	To explore the effect of step size on numerical solutions of DEs, 
%try changing to 50 time steps, and rerun the program.  Does the Euler approximation improve?
%change tsteps to 50 (check)

%(d)	Modify the program to incorporate the predictor-corrector method so as to improve the approximation.  
%Show all 3 curves (Euler, P-C, and exact) on the same graph.


%(e)	Note that values of R and L for the circuit elements will affect the time constant and hence the current response.  
%For example, if the resistance R is doubled, ? will be halved.  See what effect this has on the current response.
%multiply R by 2, tau is halved, decays faster 

%problem 2
%initialize a value for current, resistance, input voltage and inductance
I0 = 0;
L = 3;
R = 20;
Vin = 120;
%use inductance and Resistance to set a value for tau
Tau = L/R;
%set a number of interations
tsteps = 50;
%set intial and final values for time
ti = 0;
tf = 1;
%set increment h for spacing on the x axis
h = (tf-ti)/(tsteps);
%create an array of time points
Tvec = linspace(ti,tf,tsteps+1);
%allocate an empty array for the current
IEvec = zeros(1,tsteps+1);
%place the first value of current into the first element of the empty
%vector
IEvec(1) = I0;

%predictor corrector method:
%create a new zero vector for this method identitcal to one set for Euler
%method, also create an identical one for predictor-corrector method
ICvec = zeros(1,tsteps+1);
ICvec(1) = I0;

%apply iterative Euler method to solve the natural response ODE
%by solving for I(sub: K +1)
%also include the predictor corrector method in this loop
for k = 1:tsteps
    IEvec(k+1) = (h/L)*((-R*IEvec(k))+Vin)+(IEvec(k)); %update values each iteration
    IPvec = ICvec(k) + (h/L)*((-R*ICvec(k))+Vin); %estimate new current from old
    ICvec(k+1) = (h/L)*(-R*((ICvec(k) + IPvec)/2)+Vin)+ICvec(k); %update new current from average
end

%exact solution to the ODE
%I = I0e^(-t/tau)
Iexact = (Vin/R)*(1-exp(-Tvec ./ Tau));

%display a table of the columns
%includes Tvec,Ivec,Iexact
disp('Tvec    IEvec      ICvec      Iexact')
disp([Tvec' IEvec' ICvec' Iexact'])

%plot the graph of current over time, %also include the graph of the exact 
%solution and the predictor-corrector method
plot(Tvec,IEvec,Tvec,Iexact,Tvec,ICvec)
legend('Euler Method','Exact Plot','Predictor-Corrector Method')
title('Euler Method: RL Circuit Decay Model')
xlabel('Time(seconds)')
ylabel('Current(Amperes)')

%problem 3

%change the value of voltage into a time varying function
%initialize a value for current, resistance, input voltage and inductance
I0 = 0;
L = 3;
R = 20;

%initialize variables for the time varying function
w = 60;
phase = (pi/4);

%use inductance and Resistance to set a value for tau
Tau = L/R;
%set a number of interations, 500 this time
tsteps = 500;
%set intial and final values for time
ti = 0;
tf = 1;
%set increment h for spacing on the x axis
h = (tf-ti)/(tsteps);
%create an array of time points
Tvec = linspace(ti,tf,tsteps+1);
%allocate an empty array for the current
IEvec = zeros(1,tsteps+1);
%place the first value of current into the first element of the empty
%vector
IEvec(1) = I0;

%set time varying function for voltage
VoltFunc = @(t)120*sin((w*t)+phase);

%predictor corrector method:
%create a new zero vector for this method identitcal to one set for Euler
%method, also create an identical one for predictor-corrector method
ICvec = zeros(1,tsteps+1);
ICvec(1) = I0;

%begin the loop(predictor corrector only)
%apply iterative Euler method to solve the natural response ODE
%by solving for I(sub: K +1)
%also include the predictor corrector method in this loop
for k = 1:tsteps
    %evaluate function for voltage V at all times t, get each entry
    %of Tvec once at a time(be careful)
    Vin = feval(VoltFunc,Tvec(k));
    IPvec = ICvec(k) + (h/L).*((-R*ICvec(k))+Vin); %estimate new current from old
    ICvec(k+1) = (h/L).*(-R.*((ICvec(k) + IPvec)/2)+Vin)+ICvec(k); %update new current from average
end

%display a table of the columns
%includes Tvec,Ivec,Iexact
disp('Tvec     ICvec')
disp([Tvec' ICvec'])

%plot the graph of current over time, %also include the graph of the exact 
%solution and the predictor-corrector method
plot(Tvec,ICvec)
legend('Predictor-Corrector Method')
title('Euler Method: RL Circuit Decay Model')
xlabel('Time(seconds)')
ylabel('Current(Amperes)')
%switch plots, plot only voltage

%calculate Vr across resistor
%also reevaluate Vin
Vin = feval(VoltFunc,Tvec);
Vr = (ICvec .* R);

plot(Tvec,Vin,Tvec,Vr)
legend('Voltage over Time')
title('Voltage Across the Resistor compared with Input Voltage')
xlabel('Time(seconds)')
ylabel('Voltage(Volts)')
%set the axes(optional)
axis ([ 0.8 1 -150 150 ]);