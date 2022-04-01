% fspecial - defines filter
% 'average' 'laplacian' 'log'
% 'disk' 'motion' 'prewitt'
% 'gaussian' 'sobel' 'unsharp'
%%
w = fspecial('average',5);
I = imread('moon.tif'); 

w = fspecial('sobel');
img = imfilter(I, w,'replicate');
subplot(1,2,1)
imshow(img)

w = fspecial('prewitt');
img = imfilter(I, w,'replicate');
subplot(1,2,2)
imshow(img)

%%
clear all;
I = imread('moon.tif'); 
w = fspecial('laplacian');
img = imfilter(I, w,'replicate');
subplot(1,2,1)
imshow(img)
%laplacian, jijne hodnoty, matlab haze -4 do centeru etc..
w = [1 1 1;1 -8 1; 1 1 1];
img = imfilter(I, w,'replicate');
subplot(1,2,2)
imshow(img)

%% NONLINEAR FILTERS AHEAD
% ordfilt2 powaa
clear all;
I = imread('tire.tif');
I=rgb2gray(I);
g = ordfilt2(I,13,ones(5,5));
subplot(1,3,1)
imshow(I)
subplot(1,3,2)
imshow(g)
h = medfilt2(I,[5 5],'zeros');
subplot(1,3,3)
imshow(h)
%%













