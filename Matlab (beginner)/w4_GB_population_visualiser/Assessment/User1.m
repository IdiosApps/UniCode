%PlacesReorder
%Read the GBPlaces.csv file and reorder the places with descending population size

file = fopen('GBPlaces.csv');%open the file for reading

if(file == -1)%check has opened a file
    error('GBPlaces.csv does not exist in the current folder!');%return an error if not
end

header = fgetl(file);%use this to create the header on the saved file

% place, type, population, latitude, longitude
info = textscan(file, '%s %s %f %f %f', 'Delimiter', ',');%dont need the header lines as the first line is being read

[info{3}, indices] = sort(info{3}, 'descend');%sort by the population

for(x = 1:5)%go through the info and sort them too
    if(x ~= 3)%make sure the population is not moved around
        info{x} = info{x}(indices);
    end
end
fclose(file);%close the file as finished reading it

fopen('GBPlacesSorted.csv', 'w');%open the file again but for writing

fprintf(file, '%s\n', header);%put the top line back in

for(y = 1:length(info{1}))%go through all of the different places in the y direction
    for(x = 1:5)%go through the place, type etc, x direction
        val = info{x}(y);%get the value
        if(isnumeric(val))%check if a number
            fprintf(file, '%i', val);%if it is a number, save the number
        else
            fprintf(file, '%s', val{:});%else, print the string. the {:} is there as its seen as an array of chars
        end
        
        if(x<5)
            fprintf(file, ',');%if less than 5, add in a comma
        else
            fprintf(file, '\n');%else, add a new line
        end
    end
end
fclose(file);%close the file