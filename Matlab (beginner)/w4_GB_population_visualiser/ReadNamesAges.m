% Readfile_textscan
% script that reads from a file using textscan

% instantly transforms data into arrays
% see number inside array with {1}
% {1} shows first array made

% open the file
file_id = fopen('namesAges.csv.txt');
if (file_id == -1)
    error ('The file could not be opened.');
end

% only open the file if it exists, file_id =/= -1

% read the data with textscan
 data = textscan(file_id, '%s %f', 'Delimiter', ',', 'HeaderLines',1);
% name,age is string %s, number %f

% data diplays what information is taken
% data{1} displays the first column, name
%      2                             age


fclose(file_id);
% closed the file

%split up the structure into separate arrays for name and age
names = data{1};
ages = data{2};

%sort(ages) puts these ascendingly
[ sortedAges, indices ] = sort(ages);
% array is made, sortedAges
% array is made of associated indices

% first number listed by indices is 4, because
% 18, the lowest age, was the fourth in the list originally

[ sortedNames, indices ] = sort(names);

% export a file with the names in age order

file_id = fopen('sortedNames','w');
if ( file_id == -1 )
    error('Couldn''t open the file for writing.');
end
% only get here if file is open to write to 

% write to it
fprintf(file_id,'name,age\n');
% loop over elements of sorted names

for i = 1:length(sortedNames)
    fprintf(file_id,'%s,%i\n',sortedNames{i},sortedAges{i});
end

fclose(file_id);

%gives the names in sorted order 