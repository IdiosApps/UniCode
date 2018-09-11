% This program has the user input mass and velocity as arguments
% a function processes these arguments to output kinetic energy in J
%
%
% all the processing is done by the MV2KE function
%
%
% note: only one decimal place can be used for the mass and velocity
%
%
% the user has to enter the mass [in kilograms] of the object into the
% bracket first, and then the velocity [in metres per second] after the
% comma
%
%
mass = input('What is the mass of the object?\n');

% check that mass is positive and non-zero. If not, ask for usable value

while (mass < 0)
    mass = input('What is the mass of the object? (Nonzero & Positive only)\n');
end

velocity =input('What is the velocity of the object?\n');

KineticEnergy = MV2KE(mass,velocity);

if (KineticEnergy > 1000)
    fprintf('The kinetic energy of the particle with mass %4.1f kg and velocity %4.1f ms^-1 is %8.2e J.\n',mass,velocity,KineticEnergy); 
else
    fprintf('The kinetic energy of the particle with mass %4.1f kg and velocity %4.1f ms^-1 is %5.2f J.\n',mass,velocity,KineticEnergy);
end