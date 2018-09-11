% GBplaces_visualiser
% this program translates the reorganised data from GBplaces.csv 
% to a plot which creates a rough map of GB.
% up to line 44 is copied from my Assessment 4, as this organises
% the data in a desirable way.
% James Clark - 24/10/2014
% Recommendation: Have the plot take up either the left half or right half
% of the screen, to keep the aspect ratio close to what's realistic.

% open the read-from file
file_id = fopen('GBplaces.csv');
% end the program if the file cannot be accessed
if (file_id == -1)
    error ('The file could not be opened. It may not be in the same folder as this program.');
end

% read the data with textscan, skipping the first line (headers)
% Delimiter of ',' as data is separated by ','
data = textscan(file_id,'%s %s %d %f %f', 'Delimiter', ',', 'HeaderLines', 1);
% data has now been accessed, and needs to be sorted into individual arrays/cells

place = data{1};
type = data{2};
population = data{3};
latitude = data{4};
longitude = data{5};

% all the data is captured now, so the file can be closed
fclose(file_id);

% now the data has to be rearranged by decreasing population
[ PopulationDecreasing, indicies ] = sort(population,'descend');

% indicies have been formed from this sort, so now the 5 data fields
% will be arranged with those indicies. This rearrangement will keep
% each row of information the same, but changes its position

placesorted = place(indicies);
typesorted = type(indicies);
populationsorted = population(indicies);
latitudesorted = latitude(indicies);
longitudesorted = longitude(indicies);

% all the fields should now be ordered as desired

% turn the place type to all lower case
typesorted = lower(typesorted);

% create a new figure window
figure

% plot a point for each row of data
% hold on keeps the previous points of data on the figure
for n =1:length(place)
    hold on
    % the size of each point depend on the place's population
    % sqrt and /300 makes all places visible, and London isn't excessively
    % large
    PointMarkerSize(n) = sqrt(double(populationsorted(n)/300)); %#ok<SAGROW>
    % if the place is city, plot a red dot
    if strcmp(typesorted(n), 'city')
    plot(longitudesorted(n),latitudesorted(n),'r.','MarkerSize',PointMarkerSize(n));
    else
    % else plot a town (plot a green dot)   
    plot(longitudesorted(n),latitudesorted(n),'g.','MarkerSize',PointMarkerSize(n));
    end
end
hold off

% Label the axis and add a title
xlabel('Latitudinal position. A higher value indictes a more easterly possition');
ylabel('Longitudinal position. A higher value indictes a more northerly possition');
title('A graphic which uses 100 place''s populations and positions to produce a rough map of Great Britain''s towns and cities');

% annotate the 30 most populous places with their names
for i = 1:30
text(longitudesorted(i),latitudesorted(i),placesorted(i));
end
% this is to illustrate that towns can be bigger than cities
% unfortunately, annotations for the pairs Leeds and Bradford,
% Westminster and London overlap. this could be solved, but complicates the
% program

% a key will be annotated in the upper rightcorner - a legend won't be used
% as there's no relationship suggested between data points
text(0,57,'Red points are cities');
text(0,56.75,'Green points are towns');

% set the limits of the axes, to remove whitespace
axis([-4.5 1.5 50 57.5]);






    