function KineticEnergy = MV2KE ( mass, velocity )
% MV2KE: this function calculates kinetic energy from mass and velocity
% The function uses the equation KE = (1/2)*(m)*(v)^2 
%
% Author: James Clark
% Date: 03/10/2014
%
% Arguments : mass [kilograms], velocity [metres per second]
% Returns:    kinetic energy [joules]


    % velocity squared performs the first operation
    velocitysquared = (velocity)^2;
    % halfmass factors the half into (1/2)(m)(v)^2
    halfmass = (1/2)*(mass);
    % KineticEnergy multiplies the above two items, to give KE
    KineticEnergy = halfmass * velocitysquared;
    % the result is returned, stating the original input arguments, so the user
    % is sure of the input


end