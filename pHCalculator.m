%ph Claculator
%prompts the user for the type of acid
strength=menu('Enter strength of acid', 'Strong Acid pH', 'Weak Acid pH', 'Acid pH Plot');
%uses a switch-case structure to provide the following outputs in response.  
switch strength
    case 1 
        %Prompt user to input HA
        HA=input('Input the concentration of the acid solution: ');
        %variable Hplus=HA (this step isn’t really necessary but is done to avoid confusion elsewhere)
        Hplus=HA;
        
        if Hplus < 0 %If Hplus is less than zero, display error message
            fprintf('Error: concentration cannot be negative.  Using absolute value of %.f. \n', abs(Hplus))
            Hplus=abs(Hplus); %after displaying error message, change Hplus to absolute value
            pH=-log10(Hplus); %Calculate pH normally
            fprintf('pH is %.2f. \n', pH) %Output result
        elseif Hplus>=0 & Hplus <= 10^-7 %If Hplus is between 0 and 1e-7, assign the value 7.0 to variable pH
            pH=7.0; 
            fprintf('pH is %.2f. \n', pH) %Output result
        else
            pH=-log10(Hplus); %Calculate pH normally
            fprintf('pH is %.2f. \n', pH) %Output result
        end
    case 2
        HA=input('Input the concentration of the acid solution: '); %Get input for HA
        if HA < 0 %If HA is less than zero, display error message
            fprintf('Error: concentration cannot be negative.  Using absolute value of %.f. \n', abs(HA))
            Hplus=abs(HA); %after displaying error message, change HA to absolute value
        end
        Ka=input('Input the acid dissociation constant: ');%Get input for Ka.  This number is meant to be always positive
        if Ka < 0 %Make correction if Ka is negative
            fprintf('Error: acid dissociation constant cannot be negative.  Using absolute value of %.f. \n', abs(Ka))
            Ka=abs(Ka);
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
        if Ka < 0 %Make correction if Ka is negative
            fprintf('Error: acid dissociation constant cannot be negative.  Using absolute value of %.f. \n', abs(Ka))
            Ka=abs(Ka);
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
%Note: still doesnt work for values of HA < 1e-7 (you misinterpreted)