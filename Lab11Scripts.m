%Lab 11 Scripts

%problem 1:
%prompt user for type of substance
disp('Simple pH calculater:')
Strength = input('Enter the type of acid desired: ','s');
%implement selections for strong or weak acid
%also include an erroneous input
switch Strength
    case {'strong','Strong','STRONG'}
        disp('Very low pH.')
    case {'weak','Weak','WEAK'}
        disp('Moderately low pH.')
    otherwise
        disp('Please enter strong or weak.')
end

%problem 2

%prompt user for HA value(acid concentration)
Concentration = input('Enter the concentration of the acid: ');
%calculate pH based on user input
PerHydrogen = -log10(Concentration);
%execute different if statements based on user input
%first, check for a realistic value (non-negative)
if Concentration < 0
    disp('Please enter a realistic value for concentration.')
elseif Concentration == 0 %neutral
    disp('The pH is neutral.')
else %real value, then display
    fprintf('The pH is %.1f. \n', PerHydrogen)
end

%newly revised program (with nested if statements)
%prompt user for HA value(acid concentration)
disp('Simple pH calculator:')
Strength = input('Enter the type of acid desired: ','s');
%implement selections for strong or weak acid
%also include an erroneous input
switch Strength
    case {'strong','Strong','STRONG'}
        disp('Very low pH.')
        %prompt user for HA value(acid concentration)
        Concentration = input('Enter the concentration of the acid: ');
        %calculate pH based on user input
        PerHydrogen = -log10(Concentration);
        %execute different if statements based on user input
        %first, check for a realistic value (non-negative)
        if Concentration < 0
            disp('Please enter a realistic value for concentration.')
        %check for HA >= 0 and < 1 * 10^-7
        elseif (Concentration >= 0) && (Concentration < 1e-7)
            disp('The pH is neutral.')
        else %real value, then display
            fprintf('The pH is %.1f. \n', PerHydrogen)
        end
    case {'weak','Weak','WEAK'}
        disp('Moderately low pH.')
        %prompt user for HA value(acid concentration), also input KA value
        Concentration = input('Enter the concentration of the acid: ');
        %first, check for a realistic value of concentration (non-negative)
        KA = input('Enter a value for Ka: ');
        if Concentration < 0
            disp('Please enter a realistic value for concentration.')
        %calculate pH based on user input
        %filter out negative answers
        elseif KA < 0
            disp('Please enter a realistic value for Ka.')
            %calculate HPlus with larger value of x (quadratic formula)
        end
        a = 1; b = KA; c = -(Concentration * KA);
        x = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
        HPlus = -log10(x);
            %check conditions for HPlus, must fit weak acid
        if (x > 0) && (x < 1e-7)
            fprintf('The pH is %.1f. \n',HPlus)
        else
            disp('This is not a weak acid.')
        end
    otherwise
        disp('Please enter strong or weak.')
end

%problem 3: weak acid portion (see above, factored in)

%problem 4: menu function
%get user input from the menu, will give you either choice 1 or 2
%also include 'AcidPHPlot", gives you a value of 3
AcidType = menu('Select an acid type:','Strong Acid','Weak Acid','Acid pH Plot');
%incorporate selective programming based on choices 1 or 2 (strong/weak)
if AcidType == 1 
    disp('Very low pH.')
    %prompt user for HA value(acid concentration)
    Concentration = input('Enter the concentration of the acid: ');
    %calculate pH based on user input
    PerHydrogen = -log10(Concentration);
    %execute different if statements based on user input
    %first, check for a realistic value (non-negative)
    if Concentration < 0
        disp('Please enter a realistic value for concentration.')
        %check for HA >= 0 and < 1 * 10^-7
    elseif (Concentration >= 0) && (Concentration < 1e-7)
        disp('The pH is neutral.')
    else %real value, then display
        fprintf('The pH is %.1f. \n', PerHydrogen)
    end
if AcidType == 2    
    disp('Moderately low pH.')
    %prompt user for HA value(acid concentration), also input KA value
    Concentration = input('Enter the concentration of the acid: ');
    %first, check for a realistic value of concentration (non-negative)
    KA = input('Enter a value for Ka: ');
    if Concentration < 0
        disp('Please enter a realistic value for concentration.')
        %calculate pH based on user input
        %filter out negative answers
    elseif KA < 0
        disp('Please enter a realistic value for Ka.')
        %calculate HPlus with larger value of x (quadratic formula)
    end
    a = 1; b = KA; c = -(Concentration * KA);
    x = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
    HPlus = -log10(x);
    %check conditions for HPlus, must fit weak acid
    if (x > 0) && (x < 1e-7)
        fprintf('The pH is %.1f. \n',HPlus)
    else
        disp('This is not a weak acid.')
    end
end
if AcidType == 3
    