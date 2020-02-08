function [img,rows,cols] = img_load
% loads an image file specified by the user, determines its size, and
% displays the image in the figure window
disp('loading image')
img = imread('testimage.jpg', 'jpeg');
rows=2304;
cols=3072;
end
