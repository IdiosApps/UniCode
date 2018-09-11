function [ Farenheit ] = Celsius2Farenheit( Celsius )
%   Celsius2Farenheit converts degrees Celsius to degrees Farenheit
%   Multiplies input (Celsius) by 9, divides by 5 and adds 32
%   outputs temperature in Farenheit

Celsius2FarenheitFactor = (9/5)

% program performs multiplication before addition

prepFarenheit = Celsius * Celsius2FarenheitFactor

Farenheit = prepFarenheit + 32

fprintf('Your temperature of %4.1f degrees Celsius converts to %4.1f degrees Farenheit.',Celsius,Farenheit)

   
end

