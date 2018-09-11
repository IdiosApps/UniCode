% primechecker checks if a number is prime
% if not prime, program displays of input number
% ver 1.0: very primitive prime checker
% slow but effective factor finder

% james clark 10/10/2014

%ask user for prime
prime = input('what is your prime number?\n');

clear factorArray;
factorArray = [];
%clears factorArray, for later on

for n=2:(prime-1);
    % i.e. check every number
    if mod(prime,n) == 0;
    % mod => can divide the "prime" by itself, remainder 0
    fprintf('Your number divides by %g\n',n);    
    factorArray = [n];
    else
    % no factors
    % script continues out of this loop from n to (prime-1)
    end
end
% if the last n isn't stored in factorArray, there is no factor
% i.e. number is prime
if isempty(factorArray);
     fprintf('Your number is prime!\n');   
else
end

