function [ numout ] = rmquery( structarray )

%UNTITLED5 Summary of this function goes here

%   Detailed explanation goes here

field = input('enter the field: ', 's');

operation = input('enter operation: ', 's');

value = input('enter value: ', 's');

count=0;

 

if strcmpi(field, 'Area') || strcmpi(field, 'Capacity')

    for k = 1:length(structarray)

        if eval(sprintf('structarray(k).%s%s%s', field, operation, value))

         count=count+1;

        end

    end

else

    for k = 1:length(structarray)

        if strcmp(eval(sprintf('structarray(k).%s', field)), value)

            count=count+1;

        end

    end

end

numout = count;

end
