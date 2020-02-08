function[room] = getroomdata

%getroomdata: gathers all of the data on the sheet based on user

%input

%and stores it in the structural array "room"

%also returns the structure array as output

%prompts user for all the data

Bldgcode = input('Enter the letter building code for the desired room: ','s');

Number = input('Enter the number of the room inside the building: ','s');

Area = input('Enter the area the desired room: ');

Capacity = input('Enter maximum capacity of the room: ');

Smart = input('Enter 1 for a smart room and 0 for a non-smart room: ');

Type = input('Enter the type of the room: ');

Comment = input('Enter a few comments about the room: ','s');

%convert the smart vairabl to a logical value

Smart = (Smart > 0);

%change smart to a string reading true or false based on the input

if Smart == 1

    Smart = 'Yes';

else

    Smart = 'No';

end

%place all of the data into the structure array, make it slightly larger

%each time

%of the structural array

room = struct('Code',Bldgcode,'Number',Number,'Area',Area,'Capacity',Capacity,'Smart',Smart,'Type',Type,'Comment',Comment);

disp(room)

end


