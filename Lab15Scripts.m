%Lab 15 Scripts

%Problem 1: re use the surface area and volume functions of a cylinder
%first: initialize the production costs for surface area, volume and per
%unit
SurfaceCost = 0.0055;
VolumeCost = 0.0015;
UnitCost = 0.15;
%model a function handle for the price
%Price ($) = 3.50 [ 1 – exp ( 1.5 – 0.01 V ) ]
%tis proram will contian a function that uses this model
%contains a multivariable function handle


%volume function
function [ Volume ] = CylVol( Radius, Height)
%CylVol: Calculates the volule of a cylinder based on a radius vector 
%and a scalar height
%calculate the volume of the cylinder
Volume = (pi*Height) .* (Radius) .^2;
end

%surface area function
function [ SurfaceArea ] = CylArea( Radius,Height );
%CylArea: calculate the surface area of a cylinder given an input
%radius and height
SurfaceArea = 2*pi * (Radius.^2 + (Radius .* Height));
end

%b: writing cost, price and profit functions
%price is revenue generated per unit, cost is eactly the opposite


%c: 
%Assign a fixed value to the radius of 3 cm.
Radius = 3;
%assign a number of entires for precision:
K = input('Enter a number of independent value for precision: ');
%Accept a minimum and a maximum height value from the user
MinH = input('Enter a minimum value for the height of the can: ');
MaxH = input('Enter a maximum value for the height of the can: ');
%use them to generate a vector of heights (start with 5 values 
%once you have completed and
%tested your program, increase this to 50 to ‘smooth’ the plot).
HeightVec = linspace(MinH,MaxH,K);

%before starting the for loop, initialize a matrix for storing the results 
%of a for loop
CostVec = zeros(1,length(HeightVec));
PriceVec = zeros(1,length(HeightVec));
ProfitVec = zeros(1,length(HeightVec));
% Use a for loop to call the cost, price, and profit functions for each height value, and
%store each output in its own vector variable (use ‘array indexing’ for all 4 vector
%variables).
for n = 1:length(HeightVec)
    CostVec(n) = CanCost(Radius,HeightVec(n));
    PriceVec(n) = CanPrice(Radius,HeightVec(n));
    ProfitVec(n) = CanProfit(Radius,HeightVec(n));
end
%After the loop, generate a properly-labelled (including legend) plot that shows cost,
%price, and profit as a function of height all on the same graph.
plot(HeightVec,CostVec,HeightVec,PriceVec,HeightVec,ProfitVec)
legend('Cost','Revenue','Profit')
title('Cost,Revenue and Profit of the Cylindrical Drink Can')
xlabel('Height(cm)')
ylabel('Value(USD$)')

%d,e
r = 3;
profit_handle = @(h) CanProfit(r,h);
fzero ( profit_handle, hguess )
%part e
r = 3;
profit_handle = @(h) -CanProfit(r,h);
fminbnd(profit_handle,10,15)

%Part B: modify the script in part A

%prompt the user or a min and max value of the radius
%create an array of radii, just like an array of heights
MinRad = input('Enter a minimum value for the radius of the can: ');
MaxRad = input('Enter a maximum value for the radius of the can: ');
%assign a number of entires for precision:
C = input('Enter a number of radii: ');
K = input('Enter a number of heights: ');
%Accept a minimum and a maximum height value from the user
MinH = input('Enter a minimum value for the height of the can: ');
MaxH = input('Enter a maximum value for the height of the can: ');
%use them to generate a vector of heights (start with 5 values 
%once you have completed and
%tested your program, increase this to 50 to ‘smooth’ the plot).
%add another one for the radius
HeightVec = linspace(MinH,MaxH,K);
RadVec = linspace(MinRad,MaxRad,C);

%before starting the for loop, initialize matrices for storing the results 
%of a for loop
CostMat = zeros(K,C);
PriceMat = zeros(K,C);
ProfitMat = zeros(K,C);
% Use a for loop to call the cost, price, and profit functions for each height value, and
%store each output in its own vector variable (use ‘array indexing’ for all 4 vector
%variables).
for n = 1:K
    for p = 1:C
        CostMat(n,p) = CanCost(RadVec(p),HeightVec(n));
        PriceMat(n,p) = CanPrice(RadVec(p),HeightVec(n));
        ProfitMat(n,p) = CanProfit(RadVec(p),HeightVec(n));
    end
end

%create matrix versions of radius and height with the meshgrid function
[RadVec,HeightVec] = meshgrid(RadVec,HeightVec);
surfc(RadVec,HeightVec,ProfitMat)