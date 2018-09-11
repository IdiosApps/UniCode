%Reordering_a_file_of_data
% Assessment 4: Reordering of a data file
% Script that reads from file using textscan and that creates seperate
% arrays for each of the quantities in the file. The arrays are then sorted
% into descending population order and copied into a .csv file

% Open the file
file_id=fopen('GBplaces.csv');

if (file_id==-1);
    % an error occured when trying to read the file
    error('Could not open file');
end

% code got here so file is successfully open for reading.

% read in the data using textscan. The first two colummns which are read in
% are strings variables while the last three are floating point number variables.
% 'Headerlines' is used as the first row of the data file has headers
% describing each column.

GBplaces = textscan(file_id,'%s %s %f %f %f','Delimiter',',','Headerlines',1);

% close the data files
fclose(file_id);

% the data structure is then seperated into different arrays for the place,
% type, population, latitude and longitude.

place=GBplaces{1};
type=GBplaces{2};
population=GBplaces{3};
latitude=GBplaces{4};
longitude=GBplaces{5};

%Write out a file with the towns in descending order of population 
%the population array is then seperated into descending order and the
% other colums

[sortedpopulation, sortIndicies] =sort(population,'descend');
sortedplace= place(sortIndicies);
sortedtype= type(sortIndicies);
sortedlatitude=latitude(sortIndicies);
sortedlongitude= longitude(sortIndicies);

% opens a .csv document which the data will be written on to
sorted_places=fopen('Sortedplaces.csv','w');

if  (sorted_places==-1);
    error('could not open file for writing.\n');
end

% only get here if file is open to write to

% gives a header to the new .csv  file which we are writing on to
fprintf(sorted_places,'name_of_place, city_or_town, population, latitude, longitude\n');


for i=1:length(place);
    
    % convert cell arrays (sortedtype & sortedplace cell arrays) into arrays
    
    city_or_town= sortedtype{i};
    name_of_place=sortedplace{i};
   
    % data is written on to .csv file
    
    fprintf(sorted_places,'%s,%s,%i,%f,%f\n',name_of_place,city_or_town,sortedpopulation(i),sortedlatitude(i),sortedlongitude(i)');
end 
% Closes the files we wrote the data on to.
fclose(sorted_places);
 

