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
 
 % need sigma ( = y value error)
 
 % find sum of x
 Sx1 = sum(x(1,:));
 
 % find x^2 values
 for i = 1:length(x)
     Sx2a(i) = (x(i))^2;
 end
 % sum x^2 values
 Sx2 = sum(Sx2a(1,:));
 
 % sum y values
 Sy1 = sum(y(1,:));
 
 % find x*y pairs
 for i = 1:length(x)
     xy(i) = x(i)*y(i); %#ok<*SAGROW>
 end
 % sum xy pairs
 Sxy = sum(xy(1,:));
 
 % N pairs of values
 N = length(x);
 
 
 D = (N*Sx2)-(Sx1)^2;
 
 
 m = ((N*Sxy)-(Sx1*Sy1))/D;
 
 C = ((Sy1*Sx2)-(Sx1*Sxy))/D;
 %dm = sqrt(N/D)*sigma;
 
 %dC = sqrt (Sx2/D)*sigma;
 
 
 
 file_id = fopen('bestfit.txt','w');
if ( file_id == -1 )
    error('Couldn''t open the file for writing.');
end
% only get here if file is open to write to 

% write to it
% headers 
fprintf(file_id,'x,y\n');

% loop over elements of sorted names
% for i = 1:length(x)
% elements under headers
fprintf(file_id,'%f,%f\n',x(i),y(i));
%end
fprintf(file_id,'m   ,C\n');
fprintf(file_id,'%f,%f\n',m,C);

fclose(file_id);