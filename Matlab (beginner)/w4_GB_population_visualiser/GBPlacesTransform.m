% GBPlaces_Transform
% script that reads from a file using textscan

% open the file
file_id = fopen('GBplaces.csv');
if (file_id == -1)
    error ('The file could not be opened.');
end

% only open the file if it exists, file_id =/= -1

% read the data with textscan, skipping first line
% %d for integer, not %i
 data = textscan(file_id,'%s %s %d %f %f', 'Delimiter', ',', 'HeaderLines', 1);
place = data{1};
type = data{2};
population = data{3};
latitude = data{4};
longitude = data{5};





 
 
 
 
 
fclose(file_id);
% closed the file


