% MyPi Calculates pi based on the following idea:
% randomly generate x and y pairs between 0 and 1 (inclusive)
% plot these
% if sqrt|x^2+y^2| <=1, call this point "inside" (of unit circle)
% else point is outside
% area of unit circle = pi, quarter = pi/4
% area of axis = 1*1 = 1
% inside/outside = (pi/4)/1
%
% answers won't agree because of randomness
% perform for very large n.

% inside works like a counter
% nmax is max number of points to plot
inside = 0;
nmax = input ('How many random points do you want to iterate with?\n');

%iterate as many iterations as input in nmax
for n = 1:nmax
    
    %generate a point
    x = rand;
    y = rand;
    
    
    if sqrt(x^2+y^2) < 1;
        %point is in unit circle
    plot (x,y,'g.');
    inside = inside + 1;
    else
        %point is outside unit circle
    plot(x,y,'r.');
    end
    hold on 
end
MyPiFin = 4 * (inside/nmax);
fprintf('This program generated pi as %10.9f)',MyPiFin);

