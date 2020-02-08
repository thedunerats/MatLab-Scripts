function[] = prntable(StructArray)
%prntable: prints out a table containg the data for all of the 
%rooms in the structure array
fprintf('%12s','Code')
fprintf('%12s','Number')
fprintf('%12s','Area')
fprintf('%12s','Capacity')
fprintf('%12s','Smart')
fprintf('%12s','Type')
fprintf('%12s \n','Comment')
%each column is spaced 12 spaces apart
for k = 1:length(StructArray)
    fprintf('%12s',StructArray(k).Code)
    fprintf('%12s',StructArray(k).Number)
    fprintf('%12d',StructArray(k).Area)
    fprintf('%12d',StructArray(k).Capacity)
    fprintf('%12s',StructArray(k).Smart)
    fprintf('%12d',StructArray(k).Type)
    fprintf('%12s\n',StructArray(k).Comment)
end    
end