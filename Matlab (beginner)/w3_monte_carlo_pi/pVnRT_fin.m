% pVnRT asks the user for two quantities out of
% p, V and T, and gives the remaining one 
% using the equation pV=nRT
% James Clark 10/10/2014

% units:
t_units = 'degrees Kelvin';
v_units = 'in m^3';
p_units = 'in Pa';
% constants used in calculation:
n = 1;
R = 8.315;

% ask user for t, p or v initally
quantity1 = input('Do you want to give me  temperature [1], a pressure [2] or a volume [3] first?\n');
% (ideally) if user does not input t,p or v, ask them again
             % NOTE: the following while loop broke the program,
                 % while (quantity1~=1||quantity1~=2||quantity1~=3);
                 % quantity1 = input('Do you want to give me  temperature [1], a pressure [2] or a volume [3] first?\n');
                 % end
                 % so I'm trying an inferior if statement:
                 % if (quantity1~=1||2||3);
                 % error('Type either 1,2 or 3 for your first quantity!')
                 % end
                 % this also didn't work, so this validation will be
                 % missing from the program
              
% user has chosen one of t, p or v.
% now we need to run three sections: if they chose p, v, or t first, then
% we need to know their second quantity. This can be one of two things,
% so if statements can be used with this to deduce the needed quantity

if (quantity1 == 1);
        % t has been chosen, now p or v has to be chosen
             % NOTE: while (quantity 2 ~='t'||'p'||'v') didn't seem to work, so I'm trying
             % numerical values
        quantity2 = input('Do you want to give me  a pressure [2] or a volume [3] now?\n');
            % note: would use a while loop here, but it's similar to the
            % one I couldn't get to work earlier, so it isnt' present
    % ask for quantities, and verify they're usable
    quantity1value = input('What value do you have for t in  degrees Kelvin?\n');
    while (quantity1value < 0);
        quantity1value = input('What value do you have for t in  degrees Kelvin? Must be greater than 0.\n');
    end
    
    quantity2value = input('What value do you have for your second quantity?\n');
    while (quantity2value < 0);
        quantity2value = input('What value do you have for your second quantity? Must be greater than 0.\n');
    end
    % can't use %s or %g in input, so have to be vague here
% use nested if statements for cases quantity2 = 2, and = 3
if (quantity2 == 2);
    nRT = n*R*quantity1value;
    volume = nRT/quantity2value;
    fprintf('For 1 mole of gas at %8.2f K and %8.2f Pa, the volume is %8.4f m^3 (using R = 8.315 J/mol/K).\n',quantity1value,quantity2value,volume);
else
    % else quantity 2 is volume
    nRT = n*R*quantity1value;
    pressure = nRT/quantity2value;
    fprintf('For 1 mole of gas at %6.2f K and %8.4 m^3, the pressure is %9.2f Pa (using R = 8.315 J/mol/K).\n',quantity1value,quantity2value,pressure);
end
end

% this section is a copy, paste, and edit of the first whole if statement
% superflous comments have been removed
if (quantity1 == 2);
        % t has been chosen, now p or v has to be chosen

        quantity2 = input('Do you want to give me  a temperature [1] or a volume [3] now?\n');
            % ask for quantities, and verify they're usable
    quantity1value = input('What value do you have for p in  Pa?\n');
    while (quantity1value < 0);
        quantity1value = input('What value do you have for p in  Pa? Must be greater than 0.\n');
    end
    
    quantity2value = input('What value do you have for your second quantity?\n');
    while (quantity2value < 0);
        quantity2value = input('What value do you have for your second quantity? Must be greater than 0.\n');
    end
% use nested if statements for cases quantity2 = 1, and = 3
if (quantity2 == 1);
    nRT = n*R*quantity2value;
    volume = nRT/quantity1value;
    fprintf('For 1 mole of gas at %8.2f K and %8.2f Pa, the volume is %8.4f m^3 (using R = 8.315 J/mol/K).\n',quantity2value,quantity1value,volume);
else
    % else quantity 2 is volume
    temperature = quantity1value*quantity2value/(n*R);
    fprintf('For 1 mole of gas at %6.2f Pa and %6.2f m^3, the temperature is %9.2f K (using R = 8.315 J/mol/K).\n',quantity1value,quantity2value,temperature);
end
end

% this section is a copy, paste, and edit of the second whole if statement
if (quantity1 == 3);
        % v has been chosen, now t or p has to be chosen

        quantity2 = input('Do you want to give me  a temperature [1] or a pressure [2] now?\n');
            % ask for quantities, and verify they're usable
    quantity1value = input('What value do you have for v in  m^3?\n');
    while (quantity1value < 0);
        quantity1value = input('What value do you have for v in  m^3? Must be greater than 0.\n');
    end
    
    quantity2value = input('What value do you have for your second quantity?\n');
    while (quantity2value < 0);
        quantity2value = input('What value do you have for your second quantity? Must be greater than 0.\n');
    end
% use nested if statements for cases quantity2 = 1, and = 2
if (quantity2 == 1);
    nRT = n*R*quantity2value;
    pressure = nRT/quantity1value;
    fprintf('For 1 mole of gas at %8.2f K and %8.2f m^3, the pressure is %8.4f Pa (using R = 8.315 J/mol/K).\n',quantity2value,quantity1value,pressure);
else
    % else quantity 2 is pressure
    temperature = quantity1value*quantity2value/(n*R);
    fprintf('For 1 mole of gas at %6.2f m^3 and %8.2f Pa, the temperature is %9.2f K (using R = 8.315 J/mol/K).\n',quantity1value,quantity2value,temperature);
end
end

rerun = input ('Would you like to perform another calculation? Yes [1], or no [2]\n');
if (rerun == 1);
    run pVnRT_fin;
end
if (rerun == 2);
    disp('Thanks for using pVnRT!');
end