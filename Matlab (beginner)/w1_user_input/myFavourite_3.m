% myFavourite
% asks for my favourite TV show and displays it nicely

TVshow = input('What''s your favourite TV show?','s');

if (isempty(TVshow))
    %no favourite TV show
    disp('You don''t have one? I guess there is a lot to choose from!');
else       
    %displays favourite TV show
    fprintf('%s is your favourite TV show. \n',TVshow);     
    % now display a remark, depending on choice of TV show
switch lower(TVshow)
    case 'breaking bad'
        disp('Yeah %#!*@, Magnets! Owh!')
    case 'game of thrones'
        disp('End of program is coming')
    case 'sherlock'
        disp('This program deduced that this would be your choice.')
    case 'doctor who'
        disp('Bad Wolf.')
    otherwise
        disp('I think a friend recommended that one to me.')
end
    
    
end

