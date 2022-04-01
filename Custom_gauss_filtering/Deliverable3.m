%% Show off of filters itselves
clear all;
% params: sigmax sigmay cols rows theta
filter  = mat2gray(gauss(10,10,100,100,0));
filter2 = mat2gray(gauss(5,10,100,100,45));
filter3 = mat2gray(gauss(12,8,100,100,0));
filter4 = mat2gray(gauss(7,14,100,100,135));

figure;
subplot(2,2,1)
imshow(filter)
title('gauss(1,1,100,100,0)');
subplot(2,2,2)
imshow(filter2)
title('gauss(1,2,100,100,45)');
subplot(2,2,3)
imshow(filter3)
title('gauss(1,3,50,100,0)');
subplot(2,2,4)
imshow(filter4)
title('gauss(1,2,100,50,127)');

%% Filters applied to Concentric Circles.JPG
clear all;
img = imread('Concentric Circles.JPG');

figure;
subplot(2,2,1)
imshow(img);
title('Original: ');

filter1 = gauss(1,1,5,5,0);
im1 = imfilter(img, filter1);
subplot(2,2,2)
imshow(im1)
title('gauss(1,1,5,5,0): ');

filter2 = gauss(1,3,10,10,0);
im2 = imfilter(img, filter2);
subplot(2,2,3)
imshow(im2)
title('gauss(1,3,10,10,0): ');

filter3 = gauss(1,3,10,10,45);
im3 = imfilter(img, filter3);
subplot(2,2,4)
imshow(im3)
title('gauss(1,3,10,10,45): ');


figure;
filterx = gauss(1,2,20,20,-45);
imx = imfilter(img, filterx);
imshow(imx)
title('gauss(1,2,20,20,-45): ');

figure;
filterx = gauss(1,3,20,20,-45);
imx = imfilter(img, filterx);
imshow(imx)
title('gauss(1,3,20,20,-45): ');
%% Lena noise removal
clear all;
figure;
subplot(2,3,1)
lena = imread('lena.gif');
imshow(lena)
title('Original: ');

subplot(2,3,2)
J = imnoise(lena,'gaussian');
imshow(J)
title('Noise applied: ');

subplot(2,3,3)
filterL = gauss(2,2,10,10,0);
filtered1 = imfilter(J, filterL);
imshow(filtered1)
title('gauss(2,2,10,10,0): ');

subplot(2,3,4)
filterL2 = gauss(1,3,10,10,45);
filtered2 = imfilter(J, filterL2);
imshow(filtered2)
title('gauss(1,3,10,10,45): ');

subplot(2,3,5)
filterL3 = gauss(2,4,20,20,135);
filtered3 = imfilter(J, filterL3);
imshow(filtered3)
title('gauss(2,4,20,20,135): ');

subplot(2,3,6)
filterL4 = gauss(3,3,30,30,0);
filtered4 = imfilter(J, filterL4);
imshow(filtered4)
title('gauss(3,3,30,30,0): ');
