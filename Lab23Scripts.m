%Lab 23 Scripts

%problem 1:
%bubble, selection, and insertion, modify each 1 accordingly
x = 5:-1:1;

%problem 2: 
%create a random test vector for 100 different tests
%generate a vector of 200 random integers and calculate the time need
%for computaion during each iteration

BubbleSum = 0;
InsertionSum = 0;
SelectionSum = 0;

for c = 1:100 %100 different iterations
    TestVec = randi([0,200],1,200); 
    [V,T]= bubble(TestVec);
    [Ve,Ti] = insertion(TestVec);
    [Vec,Tim] = selection(TestVec);
    BubbleSum = BubbleSum + T; %increment time summations
    InsertionSum = InsertionSum + Ti;
    SelectionSum = SelectionSum + Tim;
end
%average all the time summations and get them for each type of sorting 
BubbleAvg = BubbleSum / 100;
SelectionAvg = SelectionSum / 100;
InsertionAvg = InsertionSum / 100;
%display all the averages
fprintf('The averge computation time for the bubble algorithm is %.f\n',BubbleAvg)
fprintf('The averge computation time for the insertion algorithm is %.f\n',InsertionAvg)
fprintf('The averge computation time for the selection algorithm is %.f\n',SelectionAvg)

%problem 3: the string sorting (lessthan function

%problem 5: the index function

%problem 7: the structural array
s = struct('numbers',{5, 3, 2, 1, 4},'English',{'Five', 'Three', 'Two', 'One', 'Four'},'Spanish',{'Cinco', 'Tres', 'Dos', 'Uno', 'Cuatro'});
clear cvar
clear index
 
%extract the first column (of numbers) into a cell array
[ cvar{1:length(s)} ] = deal(s.numbers);
 
%call the index to get a sorted index vector
index=index(cvar);
 
%display the entire table sorted by the column of numbers.
fprintf('%12s','Number')
fprintf('%12s','English')
fprintf('%12s','Spanish')
fprintf('\n')
 
%each column is spaced 12 spaces apart
 
for k = 1:length(s)
 
    fprintf('%12s',num2str(s(index(k)).numbers))
    fprintf('%12s',s(index(k)).English)
    fprintf('%12s',s(index(k)).Spanish)
    fprintf('\n')
 
end    
fprintf('\n \n')
 
%repeat this process, this time sorting by the column of English words
clear cvar
clear index
 
%extract the second column (English) into a cell array
[ cvar{1:length(s)} ] = deal(s.English);
 
%call the index to get a sorted index vector
index=index(cvar);
 
%display the entire table sorted by the column of numbers.
fprintf('%12s','Number')
fprintf('%12s','English')
fprintf('%12s','Spanish')
fprintf('\n')
 
%each column is spaced 12 spaces apart
 
for k = 1:length(s)
 
    fprintf('%12s',num2str(s(index(k)).numbers))
    fprintf('%12s',s(index(k)).English)
    fprintf('%12s',s(index(k)).Spanish)
    fprintf('\n')
 
end