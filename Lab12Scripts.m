%problem 1
y = 0;
for k = 2 : 2 : 10
     y = 10 * k;
     disp(y)
end

y = 1;
for k = 1 : 5
    y = y * k;
    disp(y)
end

y = 15;
for k = 5 : -1 : 1
     y = y - k;
     disp(y)
end

y = 1;
for k = 1 : 5
     z = y;
     y = y + z;
     disp(y)
end

y = 1;
sign = 1;
for k = 1 : 5
     sign = -sign;
     y = y + sign * 2 * k;
     disp(y)
end

%problem 2
%calculate square root of 2 through iteration
%set initial value of Total
Total = 1;
%set number of iterations in the loop
N = 50;
%input both values, then reassign value of Total
for k = 1:N
    Total = (Total + 2)^-1;
    fprintf('%d  %.16f\n',k,Total)
end
Total = Total + 1

%problem 3
%look at my_pi

%problem 4
%my_sin function

%problem 5: do in command window

%problem 6

%problem 7: