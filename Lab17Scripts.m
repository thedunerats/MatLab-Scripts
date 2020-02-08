% % %Lab 17 Scripts

%problem 2:
%open up with a switch statement
%make a menu, switch-case based on selection
%also, place a persistent loop around the entire code block that resets the
%entire program if one of the buttons is not presed
%will exit the loop if instruction are followed properly
%initialize the selection variable to begin the loop
Selection = 0;
while Selection ~= 7
    Selection = menu('Image Options','Load New Image','Reset Image','Crop','Levels','Adjust','Save Changes','Quit');
    switch Selection
        case 1
            % % %1.	‘Load New Image’—call img_load function to load image file and
            % determine size, assigning outputs to variables pic1, nr, and nc.
            % Also assign a duplicate of the image data to a variable pic2, which
            % will be used for all image processing in the program; pic1
            % will store the original unprocessed image data.
            FotoMat = img_load;
            pic1 = FotoMat(1);
            nr1 = FotoMat(2);
            nc1 = FotoMat(3);
            %repeat with another image, used to editing
            %first is a standard of comparison
            pic2 = FotoMat(1);
            nr2 = FotoMat(2);
            nc2 = FotoMat(3);
            % 2.	‘Reset Image’—reset pic2 to the original image data, and call
            % img_compare to display the two images side by side
            %(they should now be identical).
        case 2
            pic2 = pic1;
            img_compare(pic1,pic2);
            % 3.	‘Crop’—call img_crop and then img_compare to display
            % original and cropped images.
        case 3
            pic2 = img_crop(pic2);
            img_compare(pic1,pic2);
            % 4.	‘Levels’—call img_levels with pic2 to plot the
            % color levels at a desired row in the image.
        case 4
            img_levels(pic2);
            % 5.	 ‘Adjust’—call img_adjust in order to adjust the
            % colors in the image, and then call img_compare to display result.
            % The user can restrict the adjustments to pixels in a
            % particular color range; this is accomplished through a subfunction img_mask.
        case 5
            pic2 = img_adjust(pic2);
            % 6.	‘Save Changes’—call img_save to save processed image file.
        case 6
            img_save(pic2);
            % 7.	‘Quit’—close all figure windows using command
            % close(all) and display goodbye message.
        case 7
            disp('Goodbye!')
        otherwise %if nothing is selected
            disp('Please select a button from the menu.') %error message
    end
end

%problem 4
