% pVnRT asks the user for two quantities out of
% p, V and T, and gives the remaining one 
% using the equation pV=nRT
% James Clark 10/10/2014

% units:
t_units = 'degrees Kelvin';
v_units = 'in m^3';
p_units = 'in pa';
% constants used in calculation:
n = 1;
R = 8.315;

% ask user for t, p or v initally
quantity1 = input('Do you want to give me  [t]emperature, a [p]ressure or a [v]olume first?\n','s');
% if user does not input t,p or v, ask them again
while (quantity1 ~='t'||'p'||'v')
    quantity1 = input('Do you want to give me  [t]emperature, a [p]ressure or a [v]olume first?\n','s');
end
% user has chosen one of t, p or v.
% now we need to run three sections: if they chose p, v, or t first, then
% we need to know their second quantity. This can be one of two things,
% so an if statement can be used to deduce the needed quantity, and its
% value
if (quantity1 == 't');
        % t has been chosen, now p or v has to be chosen
        quantity2 = input('Do you want to give me  a [p]ressure or a [v]olume now?\n','s');
            while (quantity2 ~='p'||'v');
            % ensure p or v is going to be given
            quantity2 = input('Do you want to give me  a [p]ressure or a [v]olume now?\n','s');
            end
    if ( quantity2 == 'p');
       quantity2units = pa;
       % this ensures they input the quantity in correct units
    else quantity2units = m^3;
    end
    quantity1value = input('What value do you have for t in  degrees Kelvin?');
    quantity2value = input('What value do you have for %s in %s?\n',quantity2,quantity2units);
end

    
%%% need to copy + edit this for the other two options
%%% then calculate the missing variable.



