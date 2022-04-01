%% 1-3
I = imread('coins.png');
% Laplacian filter
h = -1 * ones(3);
h(2,2) = 8;  % kernel = [-1,-1,-1; -1,8,-1; -1,-1,-1]
img = rgb2gray(I);

subplot(1,2,1)
% I1 = imgaussfilt(img);
% I1 = imfilter(I1,h);
% 
% log = fspecial('log', [3,3], 0.3);
% I1 = imfilter(img,log);

I1 = edge(img,'log');

imshow(I1)

I2 = medfilt2(img,[3 3]);
I2 = imfilter(I2,h);
subplot(1,2,2)
imshow(I2)