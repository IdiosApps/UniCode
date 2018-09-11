function KineticEnergy = MV2KE ( mass, velocity )
% MV2KE: this function calculates kinetic energy from mass and velocity
% The function uses the equation KE = (1/2)*(m)*(v)^2 
%
% Author: James Clark
% Date: 03/10/2014
%
% Arguments : mass [kilograms], velocity [metres per second]
% Returns:    kinetic energy

% enter the mass and velocity between the equals signs and semicolons below

mass =;

velocity =;

if(isempty(mass));
    % mass has not been input, terminate script
    error('Mass has not been input. Try the command help ClassicalKineticEnergy')
end
 
if(isempty(velocity));
    % mass has not been input, terminate script
    error('Velocity has not been input. Try the command help ClassicalKineticEnergy - you likely made a formatting mistake.')

% check that mass is positive and non-zero. If not, terminate script
if (mass <= 0)
    error('You have entered a zero or negative mass.')
else  
   
    % velocity squared performs the first operation
    velocitysquared = (velocity)^2;
    % halfmass factors the half into (1/2)(m)(v)^2
    halfmass = (1/2)*(mass);
    % KineticEnergy multiplies the above two items, to give KE
    KineticEnergy = halfmass * velocitysquared;
    % the result is returned, stating the original input arguments, so the user
    % is sure of the input
end

if (KineticEnergy > 1000)
    fprintf('The kinetic energy of the particle with mass %4.1f kg and velocity %4.1f ms^-1 is %8.2e J.',mass,velocity,KineticEnergy); 
else
    fprintf('The kinetic energy of the particle with mass %4.1f kg and velocity %4.1f ms^-1 is %5.2f J.',mass,velocity,KineticEnergy);

end