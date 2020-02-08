
% Lab 22 Scripts




%problem 1: make a persistent menu that has user enter specific options

%initialize a  persistent menu variable

%initialize a blank net array before the menu starts

Check = exist('NetStructArray');

if Check == 0

    NetStructArray = struct('Code',0,'Number',0,'Area',0,'Capacity',0,'Smart',0,'Type',0,'Comment',0);

end

SearchMenu = 0;

while SearchMenu ~= 6

    SearchMenu = menu('Building Inventory Database','Enter Data','Display Table','Total Area','Average Capacity','Query','Quit');

    switch SearchMenu

        case 1

            %write a function called getroomdata, gathers data and addts it to

            %a structure array room that contains data for all of the rooms

            %initlalize a structure array before calling the function

            k = length(NetStructArray);

            %call the getroomdata function, make it longer every time

            Room = getroomdata;

            if NetStructArray(1).Area == 0 && NetStructArray(1).Capacity ==0

                NetStructArray(k) = Room;

            else

                NetStructArray(k + 1) = Room;

            end

            %this was done because an array of all zeros was initialized

            %will erase the zeros if no other entries have been

            %entered

        case 2

            prntable(NetStructArray)

        case 3

            TotalArea = 0;

            for c = 1:length(NetStructArray)

                TotalArea = TotalArea + NetStructArray(c).Area;

            end

            fprintf('Total Area of all the rooms is %.f \n',TotalArea)

        case 4

            AverageCapacity = 0;

            for m = 1:length(NetStructArray)

                AverageCapacity = AverageCapacity + NetStructArray(m).Capacity;

            end

            AverageCapacity = (AverageCapacity / length(NetStructArray));

            fprintf('Average room capacity = %f \n',AverageCapacity)

        case 5

            

        case 6

    end

end




%problem 2

%write a function called getroomdata, gathers data and addts it to 

%a structure array room that contains data for all of the rooms

%this block of code is under case 1




%problem 3

%call a function prntable

%will be placed under the "Display Table" option under case 2




%problem 4

%Total Area: calculate the sum of all the areas of all the rooms

%in whatever units are designated(case 3)

%initialize summation variable, run through all the entries

TotalArea = 0;

for c = 1:length(NetStructArray)

    TotalArea = TotalArea + NetStructArray(c).Area;

end

fprintf('Total Area of all the rooms is %.f \n',TotalArea)




%problem 5: average capacity of all the rooms

%initialize an average and calculate it

AverageCapacity = 0;

for m = 1:length(NetStructArray)

    AverageCapacity = AverageCapacity + NetStructArray(m).Capacity;

end

AverageCapacity = (AverageCapacity / length(NetStructArray));

fprintf('Average room capacity = %f \n',AverageCapacity)











