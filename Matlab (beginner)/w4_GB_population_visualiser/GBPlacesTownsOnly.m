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



% all the data is captured now 
fclose(file_id);
% closed the file
% need to write out a file with towns only

% c (city) comes before t (town)
[ sortedTowns, indices ] = sort(type);
% 45 - 100 are towns

% add headers to target write file
file_id = fopen('GBPlaces_towns.txt','w');
             if ( file_id == -1 )
             error('Couldn''t open the file for writing.');
             end
             % write headers to it, if file is accesible
             fprintf(file_id,'place  ,type    ,population,latitude,longitude\n');
             fclose(file_id);

for i=1:length(sortedTowns);
    stringcompare = (strcmp('sortedTowns(i)' ,'town'));
    if stringcompare == 1;
       % index = indices(i);
       %
         file_id = fopen('GBPlaces_towns.txt','w');
             if ( file_id == -1 )
             error('Couldn''t open the file for writing.');
             end
             % write data to it, if file is accesible
             % somehow have to use index
             fprintf(file_id,'%s,%s,%d,%f,%f',place(indices(i)),type(indices(i)),population(indices(i)),latitude(indices(i)),longitude(indices(i))\n');
             fclose(file_id);
    end
end


 



