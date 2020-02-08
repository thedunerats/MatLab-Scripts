%lab 20 Scripts

%Problem 1:
% Simulation of 1D random walk for a number of particles
tic; %start the timer
p = 0.5;
Nsteps = 500; % number of steps in walk
stepinterval = 20; %plot the histogram every x (stepinterval) iterations
Nparticles = 1000; % number of particles to simulate
x = zeros(1,Nparticles); % all particles start at x = 0
L=100;
m=0;
xnew=0;

for k = 1:Nsteps % for each step in the walk
    for n = 1:length(x) % and for each particle
        r = rand; % 'toss coin'
        if r < p % 50/50 chance of
            x(n) = x(n) + 1; % moving right
        else % or
            x(n) = x(n) - 1; % moving left
        end
    end
    m=1; %initialize a vector indexing counter
    for j = 1:length(x)
        if x(j) > 0 && x(j) <= L
            xnew(m)=x(j); %allocate all positive entries into a new vector
            m=m+1; %increment the indexing counter by 1
        end
    end
    x=[xnew, zeros(1,Nparticles)]; %add 1000 new zeros into the x vector
    %every time
    if rem(k, stepinterval)==0; 
        Ndist = hist(x, 0:100); % count particles at each position
        plot(0:100, Ndist) % plot distribution of particles
        pause(0.01) % pause briefly for viewing
    end
end

%initialize a value for theta, create a vector
Theta = zeros(1,length(Ndist));
for c = 1:length(Ndist)
    Theta(c) = (Ndist(c)./Ndist(1));
end
disp('Finished!')

%set number of steps to 500, plot Theta over x
PositionVec = linspace(0,.1,101); %set a position vector for x values
%will be relative to L of wall
plot(PositionVec,Theta)
%label the graph
title('Random Walk Model of Heat Transfer over 500 iterations')
xlabel('Position')
ylabel('Theta')
toc; %stops the timer

%problem 2: replacing the loops in problem 1 with logical vectors
% Simulation of 1D random walk for a number of particles
tic; %starts the timer
Nsteps = 500; % number of steps in walk
stepinterval = 20; %plot the histogram every x (stepinterval) iterations
Nparticles = 1000; % number of particles to simulate
x = zeros(1,Nparticles); % initialize vector consisting of the position 
%values
L=0.1; %set the length of the wall equal to a variable
xnew=zeros(1,Nparticles); %initialize a replacement 
%vector for deleted entries

for k = 1:Nsteps % for each step in the walk
    %initialize a filter vector to clear entries that exit the system
    %will change length each iteration of the loop
    RandVec = rand(1,length(x)); %reset random number vector every time
    MoveLeft = -1 .* (RandVec < .5); %moves all entries below .5 left
    MoveRight = (RandVec >= .5); %moves all entries .5 and above up by 1;
    x = x + MoveLeft + MoveRight; %combines the 
    %leftward and rightward movement with original x vector, all 
    %have the same number of entries
    x = x(x >= 0); %remove all negative entries from the vector
    x = x(x ~= 100); %remove all 100s to resemble steady-state 
    %for long times
    x = [xnew,x]; %add 1000 new zeros into the x vector
    %every time
    if rem(k, stepinterval)==0; %plot the histogram every 20 iterations
        Ndist = hist(x, 0:100); % count particles at each position
        plot(0:100, Ndist) % plot distribution of particles
        pause(0.01) % pause briefly for viewing
    end
end
toc; %stops timer, displays elapsed time

%problem 3:
Nsteps = 500; % number of steps in walk
stepinterval = 5; %plot the histogram every x (stepinterval) iterations
Nparticles = 1000; % number of particles to simulate
x = zeros(1,Nparticles); % initialize vector consisting of the position 
%values
L=0.1; %set the length of the wall equal to a variable
xnew=zeros(1,Nparticles); %initialize a replacement 
%vector for deleted entries

%dimensionalize random walk, must reflect real values
%initialize a value for alpha
%input realistic values for the following parameters of 
%the material alumina (Al2O3)
K = 18; %thermal conductivity
Cp = 880; %specific heat
rho = 3690; %density
%then use them to get the value of thermal diffusivity alpha
alpha = (K/(rho*Cp));

%specify values for both dx and dt
%use the same values used in Lab 18
%dx = L/100;
%set number of steps to 500, plot temperature over x
PositionVec = linspace(0,.1,101); %set a position vector for x values
%will be relative to L of wall
dx = L/100; %specify a dx value
%specify dt value
dt = (dx^2) / (2*alpha);

for k = 1:Nsteps % for each step in the walk
    %initialize a filter vector to clear entries that exit the system
    %will change length each iteration of the loop
    RandVec = rand(1,length(x)); %reset random number vector every time
    MoveLeft = -1 .* (RandVec < .5); %moves all entries below .5 left
    MoveRight = (RandVec >= .5); %moves all entries .5 and above up by 1;
    x = x + MoveLeft + MoveRight; %combines the 
    %leftward and rightward movement with original x vector, all 
    %have the same number of entries
    x = x(x >= 0); %remove all negative entries from the vector
    x = x(x ~= 100); %remove all 100s to resemble steady-state 
    %for long times
    x = [xnew,x]; %add 1000 new zeros into the x vector
    %every time
    if rem(k, stepinterval)==0; %plot the histogram every 20 iterations
        Ndist = hist(x, 0:100); % count particles at each position
        plot(0:100, Ndist) % plot distribution of particles
        pause(0.01) % pause briefly for viewing
    end
end

%initialize a value for theta, create a vector
Theta = zeros(1,length(Ndist));
for c = 1:length(Ndist)
    Theta(c) = (Ndist(c)./Ndist(1));
end
TempVec = (Theta .* (60-50)) + 50; %transform theta into a temperature
%vector
%specify values for Tin and Tout, in this case Tin = 60 and Tout = 50
ElapsedTime = Nsteps * dt; %find the total time by multiplying the time 
%difference dt by the number of steps in the walk
RandHead = sprintf('Stochastic model at t = %.4f \n',ElapsedTime);%store 
%this value as a string, will use later in the legend of the overall graph
plot(PositionVec,TempVec,'o')
%label the graph
title('Random Walk Model of Heat Transfer')
legend(RandHead) %use a legend to specify the time elapsed by the entire
%walk
xlabel('Position(L)')
ylabel('Temperature(C)')

%problem 4: merge stochastic model with deterministic model (same graph)
%place the code for the entire stochastic model here
Nsteps = 500; % number of steps in walk
stepinterval = 5; %plot the histogram every x (stepinterval) iterations
Nparticles = 1000; % number of particles to simulate
x = zeros(1,Nparticles); % initialize vector consisting of the position 
%values
L=0.1; %set the length of the wall equal to a variable
xnew=zeros(1,Nparticles); %initialize a replacement 
%vector for deleted entries

%dimensionalize random walk, must reflect real values
%initialize a value for alpha
%input realistic values for the following parameters of 
%the material alumina (Al2O3)
K = 18; %thermal conductivity
Cp = 880; %specific heat
rho = 3690; %density
%then use them to get the value of thermal diffusivity alpha
alpha = (K/(rho*Cp));

%specify values for both dx and dt
%use the same values used in Lab 18
%dx = L/100;
%set number of steps to 500, plot temperature over x
PositionVec = linspace(0,.1,101); %set a position vector for x values
%will be relative to L of wall
dx = L/100; %specify a dx value
%specify dt value
dt = (dx^2) / (2*alpha);

for k = 1:Nsteps % for each step in the walk
    %initialize a filter vector to clear entries that exit the system
    %will change length each iteration of the loop
    RandVec = rand(1,length(x)); %reset random number vector every time
    MoveLeft = -1 .* (RandVec < .5); %moves all entries below .5 left
    MoveRight = (RandVec >= .5); %moves all entries .5 and above up by 1;
    x = x + MoveLeft + MoveRight; %combines the 
    %leftward and rightward movement with original x vector, all 
    %have the same number of entries
    x = x(x >= 0); %remove all negative entries from the vector
    x = x(x ~= 100); %remove all 100s to resemble steady-state 
    %for long times
    x = [xnew,x]; %add 1000 new zeros into the x vector
    %every time
    if rem(k, stepinterval)==0; %plot the histogram every 20 iterations
        Ndist = hist(x, 0:100); % count particles at each position
        plot(0:100, Ndist) % plot distribution of particles
        pause(0.01) % pause briefly for viewing
    end
end

%initialize a value for theta, create a vector
Theta = zeros(1,length(Ndist));
for c = 1:length(Ndist)
    Theta(c) = (Ndist(c)./Ndist(1));
end
TempVec = (Theta .* (60-50)) + 50; %transform theta into a temperature
%vector
%specify values for Tin and Tout, in this case Tin = 60 and Tout = 50
ElapsedTime = Nsteps * dt; %find the total time by multiplying the time 
%difference dt by the number of steps in the walk
RandHead = sprintf('Stochastic model at t = %.4f \n',ElapsedTime); 
%store this value as a string, will use later in the 
%legend of the overall graph
DetHead = sprintf('Deterministic model at t = %.4f \n',ElapsedTime);
%do the same for the deterministic model

%code for deterministic model
%get initial values and inputs for the FiniteConduct Function
k = 18; %thermal conductivity
Cp = 880; %specific heat
rho = 3690; %density
%then use them to get the value of thermal diffusivity alpha
alpha = (k/(rho*Cp));
%initialize a value of t for the elapsed time
Time = 45.1;
%initialize two deterministic vectors based on FiniteConduct and InfConduct
FinCon = FiniteConduct(PositionVec,Time,alpha,L);
InfCon = InfConduct(PositionVec,Time,alpha);
%redefine both deterministic models in terms of temperature instead of
%theta
FinCon = (10 .* FinCon) + 50;
InfCon = (10 .* InfCon) + 50;
%plot both models on same graph (account for both deterministic models)
if InfConduct(L,Time,alpha) <= .001
    plot(PositionVec,InfCon,PositionVec,TempVec,'ro')
else
    plot(PositionVec,FinCon,PositionVec,TempVec,'ro')
end

%label the graph
title('Random Walk Model of Heat Transfer compared to deterministic model')
legend(DetHead,RandHead) %use a legend to specify 
%the difference between the 2 models
xlabel('Position(L)')
ylabel('Temperature(C)')