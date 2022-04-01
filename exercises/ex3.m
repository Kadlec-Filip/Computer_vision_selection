close all;
clear all;

A = [
0 0 0 70 70 70 0 0 70 70 0 0;
0 0 0 70 70 70 0 0 70 70 0 0;
0 0 0 70 70 70 0 0 70 70 0 0;
0 0 50 20 20 20 50 0 0 0 0 0;
0 50 20 20 20 40 20 50 0 0 0 0;
0 50 20 20 40 20 20 50 0 0 0 0;
0 50 20 40 20 20 20 50 0 0 0 0;
0 50 40 20 20 20 20 50 0 0 0 0;
0 0 50 20 20 20 50 0 0 0 0 0;
0 50 20 20 20 20 20 50 0 0 0 0;
0 50 50 50 50 50 50 50 0 0 0 0;
];
figure;
% subplot(3,3,1)
% imshow(A)

A1 = imerode(A,[ 1 1 1;1 1 1; 1 1 1])
% subplot(3,3,2)
% imshow(A1)
% title('erosion [ 1 1 1;1 1 1; 1 1 1]')

A2 = imdilate(A1,[ 1 1 1;1 1 1; 1 1 1])
subplot(2,3,1)
imshow(A2)
title({'1) binarized', 'dilated and eroded with [ 1 1 1;1 1 1; 1 1 1]'})


%erosion + dilation
A3 = bwmorph(A2,'open')
subplot(3,3,2)
imshow(A3)
title('2) opening = erosion + dilation using bwmorph()')


A4 = imdilate(A3,[1 1 0])
subplot(2,3,3)
imshow(A4)
title('3) dilation [1 1 0]')


A5 = padarray(A4,[1 1],0)
% subplot(3,3,6)
% imshow(A5)
% title('zero padding')

A6 = imdilate(A5,[0 1 0; 1 1 1; 0 1 0])
A6 = imerode(A6,[0 1 0; 1 1 1; 0 1 0])
A6 = imerode(A6,ones(3,3))

A6print= A6;
A6print(1,:) = [];
A6print(end,:) = [];
A6print(:,1) = [];
A6print(:,end) = [];
subplot(2,3,4)
imshow(A6print)
title({'4) dilation + erosion [0 1 0; 1 1 1; 0 1 0]','erosion ones(3,3)'})

A7 = imdilate(A6, [1 1 1])
A7 = imdilate(A7, [1;1;0])

subplot(2,3,5)
A7(1,:) = [];
A7(end,:) = [];
A7(:,1) = [];
A7(:,end) = [];
imshow(A7)
title({'5) dilation [1 1 1]','erosion [1;1;0]'})

A7 = padarray(A7,[1 1],0)
A8 = A7 - imerode(A7,[1 1 1;1 1 1;1 1 1])
A8(1,:) = [];
A8(end,:) = [];
A8(:,1) = [];
A8(:,end) = [];
subplot(2,3,6)
imshow(A8)
title({'Result','6)=5) - eroded(5)) with ones(3,3)'})

endimage = [
0 0 1 1 1 1 0 0 0 0 0 0;
0 0 1 0 0 1 0 0 0 0 0 0;
0 1 1 0 0 1 0 0 0 0 0 0;
0 1 0 0 0 0 1 0 0 0 0 0;
1 1 0 0 0 0 1 1 0 0 0 0;
1 0 0 0 0 0 0 1 0 0 0 0;
1 1 0 0 0 0 1 1 0 0 0 0;
0 1 0 0 0 0 1 0 0 0 0 0;
0 1 0 0 0 0 1 0 0 0 0 0;
0 1 1 0 0 1 1 0 0 0 0 0;
0 0 1 1 1 1 0 0 0 0 0 0 ; 
];
figure;
imshow(endimage)






