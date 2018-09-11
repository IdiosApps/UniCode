% xyData reader
% script that reads from a file using textscan

% instantly transforms data into arrays
% see number inside array with {1}
% {1} shows first array made

% open the file
file_id = fopen('xyData');
if (file_id == -1)
    error ('The file could not be opened.');
end
% program aborts if file is inaccesible

% read the data with textscan
 data = fscanf(file_id, '%f %f', [2 inf]);
 % create two arrays from this data, x and y
 x = data(1,:);
 y = data(2,:);
 
 for i = 1:length(x)
    Quadrature(i) = sqrt(x(i)^2+y(i)^2);
    % refer to each element of quadrature, x and y
 end

 
 
 file_id = fopen('quadrature.txt','w');
if ( file_id == -1 )
    error('Couldn''t open the file for writing.');
end
% only get here if file is open to write to 

% write to it
% headers
fprintf(file_id,'x,y,quadrature\n');

% loop over elements of sorted names
for i = 1:length(x)
    fprintf(file_id,'%f,%f,%f\n',x(i),y(i),Quadrature(i));
end

fclose(file_id);