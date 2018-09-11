% reorderFile
% script to put the GBplaces.csv data into descending population order

% open the file for reading
file_id = fopen('GBplaces.csv');

% error check
if ( file_id == -1 )
    error('Could not open the file for reading!');
end

% file is open for reading, so read the data
data = textscan(file_id,'%s %s %d %f %f','Delimiter',',','HeaderLines',1);

% close the input file
fclose(file_id);

% split up the data structure into arrays
places = data{1};
types = data{2};
populations = data{3};
longitudes = data{4};
latitudes = data{5};

% sort the populations
[ sortedPopulations indices ] = sort(populations,'descend');

% open the output file
file_id = fopen('sortedPopulations','w');

% error check
if file_id == -1
    error('Couldn''t open file for writing!');
end

% write out the data
for i = 1:length(places)
    ix = indices(i);
    fprintf(file_id,'%s,%s,%d,%g,%g\n',places{ix},types{ix},populations(ix),latitudes(ix),longitudes(ix));
end

% close the file
fclose(file_id);