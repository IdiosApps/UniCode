% Readfile_textscan
% script that reads from a file using textscan

% open the file
file_id = fopen('GBplaces.csv');
if (file_id == -1)
    error ('The file could not be opened.');
end

% only open the file if it exists, file_id =/= -1

% read the data with textscan, skipping first line
 data = textscan(file_id, '%s %s %i %f %f', 'Delimiter', ',','HeaderLines',1);






 
 
 
 
 
fclose(file_id);
% closed the file


