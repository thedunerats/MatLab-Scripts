
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

%extract the first column (of numbers) into a cell array
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