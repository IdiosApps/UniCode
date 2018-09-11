% asks user their: name,
% favourite food, and if they could win a food eating competition with it
% formats this information at the end

name = input('What''s your name?','s');

favouritefood = input('What''s your favourite food?','s');

likeit = input('Do you really like it?','s');

reallylikeit = input ('Do you REALLY like it?','s');

enoughtowin = input ('Enough to win an eating competition?!','s');

% note: the above three variables are duds

fprintf('My name is %s...\n',name);

fprintf('...and one day I will win a competition by eating %s.',favouritefood);