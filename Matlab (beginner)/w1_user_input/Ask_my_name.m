% greet_me 

% asks user for name, and greets them

% program asks user for their name

% checks for dashes on lines of code [done]

myname = input('What is your name?','s');

%'s' makes the input a string, variable myname

fprintf('Hello, %s.\n',myname,'how are you today?')

% %s for string
% \n for new line 
% the ! is just an !

% user inputs how they are

howyouare = input ('On a scale of 1-10 how are you?', 's');

fprintf('That''s good/not too good, %s.\n',myname)

% double apostraphe in code for single apostraphe in output
