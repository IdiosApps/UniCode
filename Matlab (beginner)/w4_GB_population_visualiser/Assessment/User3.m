%sortGBP
%Week 4 of an introduction to programming.
%Will sort the data from GBplaces.csv by population in descending order.

%Author: Evan Tillotson
%Date: 21.10.2014

%Open the file
file_id = fopen('GBplaces.csv');

%Test to see if file has been opened
if (file_id == -1);
    error('File cannot open');
end

%Reads file and assigns data for the variable data
data = textscan(file_id, '%s %s %d %f %f','Delimiter', ',' , 'Headerlines', 1);

%Labels each column of data to form new file
place = data{1};
type = data{2};
population = data{3};
latitude = data{4};
longitude = data{5};

%Closes the file so as to not overwrite anything 
fclose(file_id);

%Form new file (may not necessarily be new but will be overwritten)
file_id = fopen('sortedpopulation','w');

%Checks to make sure file has opened for writing
if (file_id == -1);
    error('File cannot open for writing');
end

%Sort file in oder of decreasing population
[sortedpopulation, indices] = sort(population, 'descend');
sortedplace = place(indices);
sortedtype = type(indices);
sortedlatitude = latitude(indices);
sortedlongitude = longitude(indices);

%Loop created to write data which is a town
for i=1:length(place)
    
%Write file in decreasing order of population     
    fprintf(file_id, '%s %s %d %f %f \n', place{i}, type{i}, population(i), latitude(i), longitude(i));
end

%Converts number arrays to strings 
sortpopulation = num2cell(sortedpopulation);
sortlatitude = num2cell(sortedlatitude);
sortlongitude = num2cell(sortedlongitude);


%Organises individual variable data into an overall cell
sortedData = [sortedplace, sortedtype, sortpopulation, sortlatitude,sortlongitude];

%Creates a variable headers
headers = {'place ', 'type ', 'population ', 'latitude ', 'longitude '};

%Adds headers into sorted data
sortedData = [headers;sortedData]; 

%Displays message to explain where the data is
fprintf('To view the 100 most populous places in Great britain,\n which are sorted in descending order due to population,\n please click on the sortedData file in the workspace to your right.');


%Close the file
fclose(file_id);