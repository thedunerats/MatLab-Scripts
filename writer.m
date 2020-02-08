function writer ( fid, structvar )
% Writes data in structure array structvar to file with id number stored in fid.
f = fieldnames(structvar);	         % creates cell array f containing field names as strings
delim = input('Please enter delimiter character: ', 's');         % prompt use for delimiter

% write header row that contains names of data fields
for m = 1 : length(f) - 1          % for each fieldname except last
    fprintf ( fid, [ '%s' delim ], f{m} );      % write to file using format %s w/ delimiter
end
fprintf ( fid, '%s\n', f{m+1} );        % write last field name w/o delim and w/ newline

% assign format code for each data field to a cell array fmtcode
for m = 1 : length(f)
    fmtcode{m} = input(['Enter format code for field ',f{m},': '], 's');
end

% write data to file
for k = 1 : length ( structvar )         % for each element in structure array
    for m = 1 : length(f)     	% for each data field
        fprintf ( fid, fmtcode{m}, eval( ['structvar(k).', f{m}] ) );   % write data element
        if m < length(f)
            fprintf ( fid, delim);	% after each element except last, add delimiter
        else
            fprintf ( fid, '\n');	% after last element, create newline
        end
    end
end