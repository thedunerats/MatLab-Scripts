function structvar = reader ( fid )
% Reads data from file with id number stored in fid. Returns data in structure array.

% read header line with field names into cell array f.  Use strtok with delimiter to separate
linestr = fgetl ( fid );    % reads first line from file as string and stores in linestr
delim = input('Please enter delimiter character: ', 's');         % prompt user for delimiter
m = 1;
while ~isempty(linestr);
    [ f{m}, linestr ] = strtok(linestr, delim);  	% break line at delim to get fields
    m = m + 1;                                      % increment # of fields
end

% determine which fields are numerical data
disp('Enter 0 if field is string, 1 if field is numerical')
for m = 1 : length(f)
    num(m) = input( [f{m},': '] );
end

% read data into cell array and then transfer to structure array with fields f
k = 1;
while ~feof ( fid )    % feof(fid) returns true when end of file encountered
    linestr = fgetl ( fid );    % read one line from file as string and store in linestr
    
    % break linestr into separate variables storing each in element of cellvar
    for m = 1 : length(f)
        [ cellvar{m}, linestr ] = strtok(linestr, delim);
        if num(m) == 1
            cellvar{m} = str2num ( cellvar{m} );	 % convert needed elements to numerical            
        end
    end
    % transfer columns (dim 2) of cell array to kth element of structure w/ fields f
    structvar(k) = cell2struct ( cellvar, f, 2 );
    k = k + 1;					% next row in data file
end