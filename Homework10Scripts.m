%Homework Assignment 10: Scripts

%problem 1: the mypower function

%problem 2: the mystery function

%problem 3: the myquicksort2 function (dont use the other one!)

%problem 4: the myrandi function

%problem 5:
%open the scores file, write it to a file id number
Fid = fopen('averages.txt','r')
%display an error if the file does not open properly
if Fid == -1
    disp('Error: File did not open successfully.')
%otherwise, read the data from the file 1 line at a time
else
    NewStruct = reader(Fid); %assigns data to a structure array
    fclose(Fid); %close the file
end
%not: the comma is the delimiter character
%store each data element in a different field of a structure array variable

%Calculate the average of the 3 exam scores for each student 
%and store the averages in a cell array 
%as well as adding them as a new field to the structure array variable
%go through every element of structural array
%calculte the averages
%add the averages as a new structural array field

%get all 3 test fields
[Test1{1:length(NewStruct)}] = deal(NewStruct.test1);
[Test2{1:length(NewStruct)}] = deal(NewStruct.test2);
[Test3{1:length(NewStruct)}] = deal(NewStruct.test3);

%merge all scores into 1 matrix, then calculate the averages
%make sure to convert the cell arrays to matrices
AvgScores = [(cell2mat(Test1))',(cell2mat(Test2))',(cell2mat(Test3))'];
%calculate the test average of each student
AvgScores = sum(AvgScores,2) ./ 3;
%add the averages as a new field to the structure array (1 by 1)
for k = 1:length(AvgScores)
    NewStruct(k).average = AvgScores(k);
end

%Sort the cell array (use any sort function) to obtain 
%a sorted index vector from lowest to highest test average
AvgScores = AvgScores';
Index = index(AvgScores);

%then use this index vector to rearrange the structure array to sorted
%order.
%use a sorting algorithm to o it
%store it in a new structure array
for c = 1:length(Index)
    NewStruct2(c) = NewStruct(Index(c));
end

%Finally, write the sorted student data to a new file averages.txt. 
%in the format (12 characters per field):
 filename = input('Please enter name of file: ', 's');
 FID = fopen(filename, 'w+'); %write to a file
 writer(FID,NewStruct2) %format codes are %s and %d