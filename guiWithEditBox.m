function guiWithEditBox
%GUI example w/ editable test box and callback function from Attaway
%2e, p449

f = figure;
set(f,'Visible','off',... %make invisible
    'Color','white',... %background color to white
    'Position',[360,500,400,250],... %position and dimensions
    'Name','GUI with edit box'); %name on figure

movegui(f,'center'); %center the figure in the screen

hsttext = uicontrol;
set(hsttext,'Style','text',...
    'Position',[100,150,200,25],...
    'String','Enter your string below:');

huitext = uicontrol;
set(huitext,'Style','edit',...
    'Position',[100,80,200,40],...
    'Callback',@callbackfn); %at event, call callbackfn

set(f,'Visible','on');
    function callbackfn(source,eventdata)
       %input arg source passes handle of object that called callbackfn
       %inputarg event eventdata passes ohter info related to event
       set([hsttext,huitext],...
           'Visible','off');
       printstr = get(huitext,'String');
       hstr = uicontrol;
       set(hstr,'Style','text',...
           'BackgroundColor','white',...
           'Position',[50,80,300,60],...
           'String',printstr,...
           'ForegroundColor','Red',...
           'Fontsize',30,...
           'Visible','on');
    end    
end