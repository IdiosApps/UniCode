% this is a super clean version of Hi-Lo game
% from http://www.javaist.com/blog/2008/11/28/guessing-game-in-matlab/

counter=0;
real_number=rand(1);
real_number=100*real_number;
number=round(real_number);
 
fprintf('I am thinking a number between 1 and 100.\n');
guess=input('Guess a number.\n');
 
while guess~= number
     counter = counter + 1;
     if guess>number
          fprintf('Your guess is too high!\n');
          guess=input('Guess another number: ');
     else
          fprintf('Your guess is too low!\n');
          guess=input('Guess another number: ');
     end
end
 
counter= counter + 1;
fprintf('Congratulations! You guessed the correct number in %g shots. \n', counter);
