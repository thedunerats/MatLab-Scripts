%Scripts for Lab 19

%problem 1:
%a)
%this program simulates a coin toss
p = 0.5;           % the probability of heads is 0.5
r = rand;          % generate a random number from 0 to 1
if r < p           % this should happen about 50% of the time
    fprintf('H')
else               % if it’s not Heads, it must be Tails
    fprintf('T')
end
fprintf('\n')       % newline after the simulation

%b) put a for loop between the first
%and last lines and use Ntoss as a counter
p = 0.5;           % the probability of heads is 0.5
for Ntoss = 1:20
    r = rand;          % generate a random number from 0 to 1
    if r < p           % this should happen about 50% of the time
        fprintf('H')
    else               % if it’s not Heads, it must be Tails
        fprintf('T')
    end
end
fprintf('\n')       % newline after the simulation

%c)
%same as the previous 2 programs, this time use a counter for
%heads and tails, initialize both of them as 0 before the loop
%modify the number of iterations each time
p = 0.5;           % the probability of heads is 0.5
Heads = 0;
Tails = 0;
for Ntoss = 1:50
    r = rand;          % generate a random number from 0 to 1
    if r < p           % this should happen about 50% of the time
        Tails = Tails + 1;
    else               % if it’s not Heads, it must be Tails
        Heads = Heads + 1;
    end
end
%caulcate both percent heads and percent tails
PercentHeads = (Heads/Ntoss) * 100;
PercentTails = (Tails/Ntoss) * 100;
%display both percent heads and percent tails
disp('Percent Heads:')
disp(PercentHeads)
disp('Percent Tails:')
disp(PercentTails)

%problem 2: random walk program
%use 1c as a starting point

%heads and tails, initialize both of them as 0 before the loop
%modify the number of iterations each time
%this time, use x and store the count in 1 variable
p = 0.5;           % the probability of heads is 0.5
Heads = 0;
Tails = 0;
x = 0;
for Ntoss = 1:50
    r = rand;          % generate a random number from 0 to 1
    if r < p           % this should happen about 50% of the time
        Tails = Tails + 1;
        x = x + 1; %1 head, random walk x
    else               % if it’s not Heads, it must be Tails
        Heads = Heads + 1;
        x = x - 1; %1 tail, random walk x
    end
    plot ( x, 0, 'o' ), axis([-20 20 -1 1]), grid;
    pause ( 0.1 )
end
%caulcate both percent heads and percent tails
PercentHeads = (Heads/Ntoss) * 100;
PercentTails = (Tails/Ntoss) * 100;
%display both percent heads and percent tails
disp('Percent Heads:')
disp(PercentHeads)
disp('Percent Tails:')
disp(PercentTails)

%b) use a random walk on a vector of "particles"
%be sure to modify nparticles and the size of the vector simultaneously
p = 0.5;           % the probability of up or down is 50/50
NParticles = 5;
x = zeros(1,NParticles); %initialize a particle storage vector
for k = 1:NParticles
    r = rand;          % generate a random number from 0 to 1
    if r < p           % this should happen about 50% of the time
        x(k) = x(k) + 1; %1 up, random walk x
    else               % either spin up or spin down
        Heads = Heads + 1;
        x(k) = x(k) - 1; %1 down, random walk x
    end
    hist(x), axis([-30 30 0 NParticles]); %generate a frequency 
    %distribution chart of the data
    pause ( 0.1 )
end

%problem 3
%write a roll function

%b: generate a histogram of the roll function
%set Nrolls to be the number of iterations in the loop
Nrolls = 10000;
%initialize a vector to store the values from the loop, be sure to update
%if teh number of iterations changes
x = zeros(1,Nrolls);
for k = 1:Nrolls
    x(k) = roll;
end
hist(x, 1:6)

%c: simulate a pair of dice
%your final result will be a total of the two rolls
%use the roll function twice and add up the vectors
Nrolls = 10000;
%initialize two vectors to simulate both dice
x = zeros(1,Nrolls);
y = zeros(1,Nrolls);
%go through the loop once for each vector
for k = 1:Nrolls
    x(k) = roll;
    y(k) = roll;
end
%create a new vector that contains sum of both vectors, combined total
z = x + y;
%plot the data distribution on a histogram
hist(z, 2:12)

%d: craps simulation
%phase 1: the come-out phase
%use a while loop for the point phase (phase 2)

%come-out phase
%first: roll 2 dice
%combine both into 1 event
Outcome1 = roll + roll;
fprintf('Point value: %d\n',Outcome1)
switch Outcome1
    case 2 || 3 || 12
        %display result
        disp(Outcome1)
        disp('Craps! The shooter loses.')
    case 3
        %display result
        disp(Outcome1)
        disp('Craps! The shooter loses.')
    case 12
        %display result
        disp(Outcome1)
        disp('Craps! The shooter loses.')
    case 7
        disp(Outcome1)
        disp('Natural: The shooter wins!')
    case 11
        disp(Outcome1)
        disp('Natural: The shooter wins!')
    otherwise %occurs if first roll does not fit under any of the above
        Outcome2 = roll + roll; %generate a second outcome
        disp(Outcome2) %display the roll each time
        while (Outcome2 ~= 7) && (Outcome2 ~= Outcome1)
            Outcome2 = roll + roll; %update outcome 2
            disp(Outcome2) %display the roll each time
        end
        if Outcome2 == 7 %do not need to display here, will display in loop
            disp('Craps! The shooter loses.')
        else %will only happen if both numbers match
            fprintf('Most recent roll: %d \n',Outcome2)
            disp('Shooter wins!')
        end
end        