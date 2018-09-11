% a neater Higher or Lower game
% using more whiles and less ifs than previous version

%generate a random number between 0 and 1
number = rand
% multiply by 100
randomnumber = number*100

% make integer between 0 and 100
roundednumber = round(randomnumber)

% user makes a guess
guess1 = input ('Guess which number I''m thinking of, between 0 and 100.\n');

% check number is within limits - if not, ask for input again.
while (guess1 < 0 || guess1 > 100)
    guess1 = input ('Guess which number I''m thinking of, ***between 0 and 100***.\n');
end

while (guess1 < roundednumber)
    guess2 = input ('Too low.\n');
end
while (guess1 > roundednumber)
    guess2 = input ('Too High.\n');
end