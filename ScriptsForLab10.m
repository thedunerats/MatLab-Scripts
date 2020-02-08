x = input('Please enter a number: ');
a = abs(x);
y = sqrt(a);
if x > 0
    fprintf('The square root of %.f is %.f. \n',x,y)
else
    fprintf('The square root of %.f is %.fi. \n',x,y)
end 

x = input('Please enter a number: ');
if x > 0
    disp('Your number is positive.')
elseif x == 0
        disp('Your number is zero.')
else
    disp('Your number is negative.')
end 

%utility bill calculator
%input user tier levels and billing rates
%set thresholds
Thresh2 = 200;
Thresh3 = 260;
Tier1 = .12; %set rates
Tier2 = .14;
Tier3 = .16;
BillingFee = 3.5; %set billing fee

%prompt user for duration
MonthlyUsage = input('Enter your monthly usage in kilowatt hours: ');
if MonthlyUsage <= 0 %check for reasonable input
    disp('Please enter a reasoanble value!')
    BaseCost = 0;
end
if MonthlyUsage < Thresh2 %baseline user
    BaseCost = MonthlyUsage * Tier1;
end
%tier 2
if (MonthlyUsage >= Thresh2) && (MonthlyUsage < Thresh3)
    Remainder = MonthlyUsage - Thresh2;
    BaseCost = (Thresh2 * Tier1) + (Remainder*Tier2);
end
%tier 3
if MonthlyUsage >= Thresh3
    Remainder = MonthlyUsage - Thresh3;
    BaseCost = (Thresh2 * Tier1) + (60*Tier2) + (Remainder*Tier3);
end

%compute and output total cost
TotalCost = BaseCost + BillingFee;
fprintf('The total electricty bill for the month is %.2f. \n',TotalCost)

%part 4
%find the roots of a quadratic equation for user inputs a, b and c
%get inputs
disp('For a quadratic equation for user inputs a, b, c:')
a = input('Enter a value for a: ');
b = input('Enter a value for b: ');
c = input('Enter a value for c: ');

%check complex roots condition
% a not equal to 0, bsquared less than or equal to 4ac
if (b^2) < (4*a*c) && a ~= 0
    x1 = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
    x2 = (-b - sqrt(b^2 - 4*a*c)) / (2*a);
    disp('Roots are complex.')
    disp(x1),disp(x2)
end

%check normal roots condition
%A not equal to 0 and bsquared >= 4ac
if (a ~= 0) && (b^2) >= (4*a*c)
    x1 = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
    x2 = (-b - sqrt(b^2 - 4*a*c)) / (2*a);
    disp('Roots are real.')
    disp(x1),disp(x2)
end

%check 1 root condition
%a = 0 and b does not equal 0

if (a == 0) && (b ~= 0)
    disp('One real root.')
    x1 = -c/b;
    disp(x1)
end

%check no solution condition
%a = b = 0 and c does not equal 0
if (a == 0 && b == 0) && (c ~= 0)
    disp('No solution.')
end

%check infinitely many solutions condition
%a = b = c = 0
if (a == 0 && b == 0) && (c == 0)
    disp('Any x is a solution.')
end