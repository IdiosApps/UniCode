% Readfile
% script that reads from a file using fscanf

% open the file
file_id = fopen('xyData');
if (file_id == -1)
    error ('The file could not be opened.');
end

% only open the file if it exists, file_id =/= -1

% read the data with fscanf
 data = fscanf(file_id, '%f %f', [2 inf]);
% numbers are separated by white space
% 2 numbers, separated by white space
% 2 colums, infinite rows

fclose(file_id);
% closed the file

%% data(1:) => first row, all elemtns

%split up data into x and y arrays

x = data(1,:);
y = data(2,:);

% plot x against y, with red dot
plot(x,y, 'r.');
