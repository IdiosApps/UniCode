% GBplaces_visualiser
% this program translates the data to a plot
% which uses the position and population data
% from the .csv file to create a rough map of GB
% This uses all the code from Assessment 4, minus
% the printing to file part. The data is organised
% in a way that I want with this old program.
% James Clark - 24/10/2014

% open the read-from file
file_id = fopen('GBplaces.csv');
% end the program if the file cannot be accessed
if (file_id == -1)
    error ('The file could not be opened. It may not be in the same folder as this program.');
end

% read the data with textscan, skipping the first line (headers)
% %s for strings: place and type, %d for integer population, %f for
% floating point decimal: latitude and longitude
% Delimiter of ',' as data is separated by ','
data = textscan(file_id,'%s %s %d %f %f', 'Delimiter', ',', 'HeaderLines', 1);
% data has now been accessed, and needs to be sorted into individual
% arrays/cells

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
% each row of information the same, but changes its location

placesorted = place(indicies);
typesorted = type(indicies);
populationsorted = population(indicies);
latitudesorted = latitude(indicies);
longitudesorted = longitude(indicies);

% all the fields should now be ordered as desired



% create a new figure window
figure

% plot a point for each row of data
% hold on & hold off keeps the points of data on the figure
for n =1:length(place)
    
    % tf: if the place is city, plot a red dot
    tf = strcmp(typesorted(n),'city');
    hold on
    % make the size of each point depend on the place's population
    PointMarkerSize(n) = sqrt(double(populationsorted(n)/300));
    if tf == 1;
    plot(longitudesorted(n),latitudesorted(n),'r.','MarkerSize',PointMarkerSize(n));
    else
    % else plot a red dot    
    plot(longitudesorted(n),latitudesorted(n),'g.','MarkerSize',PointMarkerSize(n));
    end
end
hold off
% Label the axis and add a title
xlabel('Latitudinal position');
ylabel('Longitudinal position');
title('A graphic which uses population size, longitude, latitude and colours to produce a rough map of Great Britain''s towns and cities');
% annotate the 15 most populous places with their names
for i = 1:15
text(longitudesorted(i),latitudesorted(i),placesorted(i));
end

% annotate the largest 10 places, for reference
% text(pi,0,' \leftarrow sin(\pi)')
% annotate lowest place, highest place, and furthest east and west

%
%This week I thought you'd want to devote all the time to the Assignment, so there's no specific practice. Remember MATLAB has a great deal of documentation built in, which you can scratch the surface of with the help command, e.g. help plot. Of course if you type anything into google you're bound to find something useful, e.g. 'MATLAB plot point size' will help you figure out how to change the point size if that's what you're after.

%Remember you can

%change virtually everything about the appearance of a point on a plot
%change the axes appearance using set(gca,...)
%annotate a plot using text(x,y,'label')
%draw a line between two points with plot([x1,x2],[y1,y2])
%alter the axis ranges using axis([xmin xmax ymin ymax])
%Things to consider:

%colours of things
%point style
%line style
%point size, e.g. plot(x,y,'r.','MarkerSize',20)
%fonts
%Find out how to change all these things.

%Also, if you plot a point at a time using a loop, for example, you can in principle make each point have a different style.
    