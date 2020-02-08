%Lab 13 Scripts


%problem 1: modified ph calculator
%ph Claculator
%since this version contains a while loop, initialize a value for strength
strength = 0;
%start the loop, persist until qui is selected
while strength ~= 4
    %prompts the user for the type of acid
    strength=menu('Enter strength of acid', 'Strong Acid pH', 'Weak Acid pH','Acid pH Plot','Exit');
    %uses a switch-case structure to provide the following outputs in response.
    switch strength
        case 1
  
            %Prompt user to input HA
            HA=input('Input the concentration of the acid solution: ');
            %variable Hplus=HA (this step isn’t really necessary but is done to avoid confusion elsewhere)
            Hplus=HA;
            
            while Hplus < 0 %If Hplus is less than zero, display error message
                disp('Error: concentration cannot be negative.')
                Hplus = input('Enter a new value for the acid concentration: ')
            end
            if Hplus>=0 & Hplus <= 10^-7 %If Hplus is between 0 and 1e-7, assign the value 7.0 to variable pH
                pH=7.0;
                fprintf('pH is %.2f. \n', pH) %Output result
            else
                pH=-log10(Hplus); %Calculate pH normally
                fprintf('pH is %.2f. \n', pH) %Output result
            end
        case 2
            HA=input('Input the concentration of the acid solution: '); %Get input for HA
            while HA < 0 %If Hplus is less than zero, display error message
                disp('Error: concentration cannot be negative.')
                HA = input('Enter a new value for the acid concentration: ')
            end
            Ka=input('Input the acid dissociation constant: ');%Get input for Ka.  This number is meant to be always positive
            while Ka < 0 %If Hplus is less than zero, display error message
                disp('Error: acid dissociation constant cannot be negative.')
                Ka = input('Enter a new value for the dissociation constant: ')
            end
            %Use quadratic formula to calculate H+.  H+ stands in for variable x, while coefficient a=1, b=Ka, and c=-Ka*HA.
            Hplus=(-Ka+sqrt(Ka^2-4*-Ka*HA))/2;
            if Hplus < 0 %if there is no positive root return a error message
                disp('Error: No positive solution for H+')
            elseif Hplus>=0 & Hplus <= 10^-7 %If Hplus is between 0 and 1e-7, assign the value 7.0 to variable pH
                pH=7.0;
                fprintf('pH is %.2f. \n', pH) %Output result
            else
                pH=-log10(Hplus); %Calculate pH normally
                fprintf('pH is %.2f. \n', pH) %Output result
            end
        case 3 %plot pH versus HA
            HA=linspace(.10, 1, 100); %x-axis data
            Ka=input('Input the acid dissociation constant: ');%Get input for Ka.  This number is meant to be always positive
            while Ka < 0 %If Hplus is less than zero, display error message
                disp('Error: acid dissociation constant cannot be negative.')
                Ka = input('Enter a new value for the dissociation constant: ')
            end
            %calculate pH values
            Hplus=(-Ka+sqrt(Ka.^2-4.*-Ka.*HA))./2;
            pH=-log10(Hplus); %should not be any negative values of Hplus
            plot(HA, pH);
            title(['pH Levels when Ka = ' num2str(Ka, 3)]);
            xlabel('Concentration of Acid Solution');
            ylabel('pH Level');
        otherwise
            disp('Please enter strong or weak.')
            %For any other response, the program outputs ‘Please enter strong or weak.’
    end
end
%Note: still doesnt work for values of HA < 1e-7 (you misinterpreted)

%problem 2:
%newt function

%define both function handles, 2nd is derivative of first
Handle1 = @(x)x^2 - 4;
Deriv = @(x)2*x;
newt(Handle1,Deriv,1)

%plot the original function handle, not the derivative
fplot(Handle1,[-5,5])
grid


%problem 3
%bisection function
