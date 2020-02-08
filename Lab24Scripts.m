%Lab 24 Scripts

%Problem 1: modifying the main menu of the room data compiler
%change the get room data option to a load room data option
%Modify the ‘Enter Data’ option from your menu in Lab 22 to be ‘Load Data’. 
%This option should now prompt the user for a filename containing the 
%room inventory data, and then use the reader.m function supplied on 
%the course website in order to load the data into the structure array.

%do this by replacing the getroomdata function with the reader function
%take out the initialized structure array, gets created with the reader
%function
%initializing one only causes problems in this situation

SearchMenu = 0;
while SearchMenu ~= 7
    SearchMenu = menu('Building Inventory Database','Load Data',...
        'Display Table','Total Area','Average Capacity','Query',...
    'Sort Data','Quit');
    switch SearchMenu
        case 1
            %write a function called getroomdata, gathers data and addts it to
            %a structure array room that contains data for all of the rooms
            %initlalize a structure array before calling the function
            %prompt the user for a filename an extension
            %so it all in one string
            FileName = input('Enter the name of the file with the inventory data: ','s');
            %open the file with the fopen function, assign an id #
            Fid = fopen(FileName,'r');
            %make sure the file opened properly
            if Fid == -1
                disp('Error: the file did not open properly.')
            else
            %place the room data from the file into the main structural
            %array
            Room = reader(Fid);
            %check if the array has data or not, ensures that nothing gets
            %overwritten because the initialized strcutural array contains
            %all zeros
            k = length(Room);
            end
        case 2
            prntable(Room)
        case 3
            TotalArea = 0;
            for c = 1:length(Room)
                TotalArea = TotalArea + Room(c).Area;
            end
            fprintf('Total Area of all the rooms is %.f \n',TotalArea)
        case 4
            AverageCapacity = 0;
            for m = 1:length(Room)
                AverageCapacity = AverageCapacity + Room(m).Capacity;
            end
            AverageCapacity = (AverageCapacity / length(Room));
            fprintf('Average room capacity = %f \n',AverageCapacity)
        case 5
            rmquery(Room)
        case 6
            %prompt user for a specific field to sort by
            Field = menu('Pick a field to sort:','Code','Number',...
            'Area','Capacity','Smart','Type','Comment');
            %turn this variable into a string (corresponds to field name)
            FieldNames = fieldnames(Room);
            switch Field
                case 1
                    Field = 'Code';
                case 2
                    Field = 'Number';
                case 3
                    Field = 'Area';
                case 4
                    Field = 'Capacity';
                case 5
                    Field = 'Smart';
                case 6
                    Field = 'Type';
                case 7
                    Field = 'Comment';
            end
            %place the desired field into a cell array
            [x{1:length(Room)}] = deal(Room.Field);
            %sort the indeces of the cell array
            
        case 7
    end
end

%problem 2: add a new option to the menu to sort data

%backup copy: the one that actually works
% Lab 24 Scripts

%problem 1: make a persistent menu that has user enter specific options
%initialize a  persistent menu variable
%initialize a blank net array before the menu starts
%Check = exist('NetStructArray');
%if Check == 0
    %NetStructArray = struct('Code',0,'Number',...
        %0,'Area',0,'Capacity',0,'Smart',0,'Type',...
        %0,'Comment',0);
%end
SearchMenu = 0;
while SearchMenu ~= 8
    SearchMenu = menu('Building Inventory Database','Load Data',...
        'Display Table','Sort Data','Total Area','Average Capacity','Query','Write data','Quit');
    switch SearchMenu
        case 1
            %write a function called getroomdata, gathers data and addts it to
            %a structure array room that contains data for all of the rooms
            %initlalize a structure array before calling the function
            
            %Get filename from user
            filename = input('Please enter name of file: ', 's');
            FID = fopen(filename);
            if FID == -1
                disp('Error: file failed to open')
            else
                %call the reader function, make it longer every time
                clear Room;
                Room = reader(FID);
            
               if exist('NetStructArray')==0
                   NetStructArray = Room;
               else
                   k = length(NetStructArray);
                   NetStructArray(k + 1) = Room;
               end
               %this was done because an array of all zeros was initialized
                %will erase the zeros if no other entries have been
                %entered
            end
        case 2
            prntable(NetStructArray)
        case 3
            fvar = input('Enter the field to sort by: ', 's');
            clear x;
            %transfer the field into a cell array, sort the data, and return a sorted index vector.
            eval(sprintf('[sortfield{1:length(NetStructArray)}]=deal(NetStructArray.%s);', fvar));
            sortindex = index(sortfield);
            %Use this sorted index vector to rearrange the data in the structure array
            NetStructArray=NetStructArray(sortindex); %sorts the structure array
        case 4
            TotalArea = 0;
            for c = 1:length(NetStructArray)
                TotalArea = TotalArea + NetStructArray(c).area;
            end
            fprintf('Total Area of all the rooms is %.f \n',TotalArea)
        case 5
            AverageCapacity = 0;
            for m = 1:length(NetStructArray)
                AverageCapacity = AverageCapacity + NetStructArray(m).capacity;
            end
            AverageCapacity = (AverageCapacity / length(NetStructArray));
            fprintf('Average room capacity = %f \n',AverageCapacity)
        case 6
            rmquery(NetStructArray)
        case 7
            filename = input('Please enter name of file: ', 's');
            FID = fopen(filename, 'w+');
            writer(FID ,NetStructArray) %format codes are %s and %d
            %the ones designated by fprintf / sprintf statements
        case 8
    end
end