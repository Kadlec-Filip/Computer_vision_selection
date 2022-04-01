%%
I = imread('moon.tif');
I2 = uint8(colfilt(I,[5 5],'sliding',@sum));
I3 = uint8(colfilt(I,[5 5],'sliding',@mean));
I4 = uint8(colfilt(I,[5 5],'sliding',@median));

I5 = uint8(colfilt(I,[5 5],'sliding',@max));
I6 = uint8(colfilt(I,[5 5],'sliding',@min));
%I7 = uint8(colfilt(I,[5 5],'sliding',@std));

figure;
subplot(2,2,1)
imshow(I)
subplot(2,2,2)
imshow(I2)
subplot(2,2,3)
imshow(I3)
subplot(2,2,4)
imshow(I4)

figure;
subplot(2,2,1)
imshow(I5)
subplot(2,2,2)
imshow(I6)
% subplot(2,2,3)
% imshow(I7)
%%
m = 5;
n = 5;
I = imread('moon.tif');
img = uint8(colfilt(I,[m n],'sliding',@(x) ((prod(x).^(1/(m*n))))));

figure;
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imshow(img)




















