function guiUnitConverter
%GUI example w/ editable test box and callback function from Attaway
%2e, p449

f = figure;
set(f,'Visible','off',... %make invisible
    'Color','white',... %background color to white
    'Position',[360,500,400,250],... %position and dimensions
    'Name','Converter: inches to centimeters'); %name on figure

movegui(f,'center'); %center the figure in the screen

hsttext = uicontrol;
set(hsttext,'Style','text',...
    'Position',[150,150,50,25],...
    'String','inches = ');

huitext = uicontrol;
set(huitext,'Style','edit',...
    'Position',[20,150,100,40])

hbutton = uicontrol;
set(hbutton,'Style','pushbutton',...
    'String','Convert!',...
    'Position',[120,20,150,40],...
    'Callback',@callbackfn); %at event, call callbackfn

set(f,'Visible','on');
    function callbackfn(source,eventdata)
       %input arg source passes handle of object that called callbackfn
       %inputarg event eventdata passes ohter info related to event
       set(huitext,...
           'Visible','on');
       printstr = get(huitext,'String');
       
       printstr = str2num(printstr); %convert input to a number
       printstr = (2.54 * printstr); %convert to centimeters
       printstr = num2str(printstr); %convert back into a string
       printstr = [printstr 'cm']; %add units
       
       hstr = uicontrol;
       set(hstr,'Style','text',...
           'BackgroundColor','white',...
           'Position',[210,130,150,50],...
           'String',printstr,...
           'ForegroundColor','Red',...
           'Fontsize',15,...
           'Visible','on');
    end    
end