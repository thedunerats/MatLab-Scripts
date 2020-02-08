%Lab 16 Scripts

%problem 2:
%modifying an image
V = [0:50:200];
M = [V;V;V]

%create a 3 x 3 matrix from 3 iterations of Matrix M on the Z plane
img(:,:,1) = M;
img(:,:,2) = M;
img(:,:,3) = M;

%convert img into unit8 format
img = uint8(img);
image(img)

%set entire second row to zero
img(2,:,2) = zeros(1,5);
%set 3rd row of layer 3 to zero
img(3,:,3) = zeros(1,5);
%set 3rd row of layer 2 to 200:-50:0
img(3,:,2) = [200:-50:0];
%set 2nd row of layer 3 to 200:-50:0
img(2,:,3) = [200:-50:0];

%set entire red layer to 0
img(:,:,1) = zeros(1,5);

%check which pixels have all 3 layers set to zero
img(:,:,1) == 0 & img(:,:,2) == 0 & img(:,:,3) == 0

imwrite(img,'SynImg.jpg','jpeg')

%problem 3:
img1 = imread('SynImg.jpg')
%load default axes
axis image
%load testimage.jpeg onto varible img2
img2 = imread('testimage.jpg');
%determine the size of img2
size(img2);
%determine the number of pixels in the image
Pixels = length(img2(1,:,:)) .* length(img2(:,1,:)); 
image(img2)
axis image

%problem 4:

%create a matrix that displays all the entires equal to zero
mask1 = (img1 == 0);
%replace the zero entries of img1 with 25
img1(mask1) = 25;
%create a matrix mask2 the determines which entires 
%of img1 are between 40 and 60
mask2 = (img1 >= 40) & (img1 <=60);
%change corresponding mask2 values to 255
img1(mask2) = 255;
%create mask3: marks all pixels under the value of 50
mask3 = (img1(:,:,1)<50 & img1(:,:,2)<50 & img1(:,:,3)<50);
%change the corresponding given by mask3 of img1 to zero
img1(mask3) = 0;

%load testimage
%create mask4, represents entires of red layer of img2 less than 150
mask4 = (img2(:,:,1) < 150);
%set these values to 0
img2(mask4) = 0;
%display the image at will

%create mask 5, represents all 3 color values over 150
mask5 = (img2(:,:,1)>150 & img2(:,:,2)>150 & img2(:,:,3) > 150);
%make mask5 3 dimensional
mask5 = repmat(mask5,[1 1 3]);
%set all entries in rows 200 and greater in all 3 colors equal to false
%for mask 5
mask5(200:end,:,:) = false;
%correct the remaining entries of img2 where mask5 holds true
img2(mask5) = 255;
%display the new image
image(img2)