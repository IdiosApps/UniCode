% this is a script for a higher/lower game
% uses the while condition to keep user trying inputs

%generate a random number between 0 and 1
number = rand
% multiply by 100
randomnumber = number*100

% rounds this number, so it can be guessed in half the time 
%(assuming 2dp remain after multiplication)
roundednumber = round(randomnumber)

% user makes a guess
guess1 = input ('Guess which number I''m thinking of, between 0 and 100./n');


% check guess is a number
% this is done automatically, as guess1 = input doesn't allow strings
% at the end of bracket

% check number is within limits - if not, ask for input again.
% || is very important for this to loop!
while (guess1 < 0 || guess1 > 100)
    guess1 = input ('Guess which number I''m thinking of, ***between 0 and 100***./n');
end

% begin the higher/lower game
    
%guess1 start
if ( guess1 > roundednumber );
    guess2 = input('That''s too high. Try again./n');
end 

if ( guess1 < roundednumber );
    guess2 = input('That''s too low. Try again./n');
end 
%guess1 end

%guess2 start
while (guess2 < 0 || guess2 > 100)
    guess2 = input ('Guess which number I''m thinking of, ***between 0 and 100***./n');
end

if ( guess2 > roundednumber );
    guess3 = input('That''s too high. Try again./n');
end 

if ( guess2 < roundednumber );
    guess3 = input('That''s too low. Try again./n');
end 
%guess2 end

%guess 3 start 
while (guess3 < 0 || guess3 > 100)
    guess3 = input ('Guess which number I''m thinking of, ***between 0 and 100***./n');
end
if ( guess3 > roundednumber );
    guess4 = input('That''s too high. Try again./n');
end 

if ( guess3 < roundednumber );
    guess4 = input('That''s too low. Try again./n');
end 


