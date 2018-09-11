% Assessment4_GBPlaces_DecreasingPopulation
% this program arranges a list of 100 cities & towns in Great Britain
% by decreasing population order, whilst keeping the original format
% Important: ensure that "GBplaces.csv" (read-from) and and empty .txt file called 
% "GBPlaces_Decreasing_Population.txt" (write-to) are in the same folder as 
% this program, "Assessment4_GBPlaces_Decreasing_Population.m"

% James Clark 17/10/2014

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

% an empty .txt file( "GBPlaces_Decreasing_Population.txt") will be written to now,
% please make sure it is in the same folder as this program, and is accessible.

file_id = fopen('GBPlaces_Decreasing_Population.txt','w');
             % abort program if the file cannot be written to
             if ( file_id == -1 )
             error('Couldn''t open the file for writing. It may not be in the same folder as this program.');
             end
% add the headers on the first line, above the data
fprintf(file_id,'place  ,type    ,population,latitude,longitude\n');



% the program has now finished running
% check "GBPlaces_Decreasing_Population.txt" and see if the data
% has been arranged according to decreasing population size