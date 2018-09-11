function favourite = getFavourite( thing )
% getFavourite returns the user's favourite thing
%
% Author: James Clark
% Date: 03/10/2014
%
% Arguments: the thing to ask for the favourite
% Returns: the user's response
%
% Example:
%
% >> colour = getFavourite('colour');
% What is your favourite colour? Red
%

question = sprintf('What is your favourite %s? ',thing);

favourite = input(question,'s');

end

