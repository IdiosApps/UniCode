% asks user their favourite food, and:
% if they could win a food eating competition with it

name = input('What''s your name?','s');

favouritefood = input('What''s your favourite food?','s');

% note: can't seem to put name variable into input prompt

likeit = input('Do you really like it?','s');

reallylikeit = input ('Do you REALLY like it?','s');

enoughtowin = input ('Enough to win an eating competition?!','s');

fprintf( '%s...\n',name,'...I hope you find that competition one day!')

% note: no if function needed, as the user has stated their favourite food

% edited from fprintf('Hello, %s.\n',myname,'how are you today?')
% above returns: Hello, james.
% Hello, how are you today?.

% fprintf('Well, %s',name,'I hope you find that competition one day!')
% above returns: Well, jamesWell, I hope you find that competition one day!
% no \n, but Well repeats twice - with or without the new line
% changed fprintf line to have name first, followed by joining elipses

% fprintf( '%s...\n',name,'...I hope you find that competition one day!')
% above returns :
% james...
% ...I hope you find that competition one day!...

% don't know how to remove the final elipsis, i.e. end with !
% keeping the final elipsis because it's tone is acceptable