clear all;
I = imread('Figure_Bottles.png');
I = rgb2gray(I);

h1 = -1 * ones(3);
h1(2,2) = 8;  % kernel = [-1,-1,-1; -1,8,-1; -1,-1,-1]
subplot(2,2,1)
I1 = imfilter(I,h1);
imshow(I1)
title('Laplacian')

h2 = [-1 0; 0 1];
I2 = imfilter(I,h2);
subplot(2,2,2)
imshow(I2)
title('Roberts')

h3 = [-1 -2 -1; 0 0 0; 1 2 1];
h4 = [-1 0 1; -2 0 2; -1 0 1];
I3a = imfilter(I,h3);
I3b = imfilter(I,h4);
I3 = min(255, I3a+I3b);
subplot(2,2,3)
imshow(I3)
title('Sobel')

se = [1 1 1;1 1 1;1 1 1];
I4 = I - imerode(I,se);
se = [1 1;1 1];
I4 = imdilate(imerode(I4,se),se);
I4 = imerode(imdilate(I4,se),se);

subplot(2,2,4);
imshow(I4)
title('Morph. ops.')
%%  find perimeters of bottles
%imhist(I1)
%III = rgb2gray(I1);


binaryImage = imbinarize(I4,0.0175);
figure;
imshow(binaryImage)

binaryImage = imfill(binaryImage, 'holes'); % Fill holes.
binaryImage = bwareaopen(binaryImage, 2000); % Remove small blobs.
figure;
imshow(binaryImage)

binaryImage = imdilate(binaryImage,ones(7,7));
binaryImage = imerode(binaryImage,ones(6,6));

areaPicture = binaryImage;

figure;
boundaries = bwperim(binaryImage,8); % Get list of (x,y) coordinates of outer perimeter.
imshow(boundaries)
title('boundaries')

%CC = bwconncomp(boundaries); %connected components
%labeled_contours = labelmatrix(CC);

% check that there are only 6 objects
% arr = [];
% for i=1:length(labeled_contours(:,1))
%     for j=1:length(labeled_contours(1,:))
%         if ~ismember(labeled_contours(i,j), arr)
%             arr = [arr,labeled_contours(i,j)];
%         end
%     end
% end
% 
% perim1 = 0;
% perim2 = 0;
% perim3 = 0;
% perim4 = 0;
% perim5 = 0;
% perim6 = 0;
% for i=1:length(labeled_contours(:,1))
%     for j=1:length(labeled_contours(1,:))
%             if labeled_contours(i,j) == 1
%                 perim1 = perim1+1;
%             end
%             if labeled_contours(i,j) == 2
%                 perim2 = perim2+1;
%             end
%             if labeled_contours(i,j) == 3
%                 perim3 = perim3+1;
%             end
%             if labeled_contours(i,j) == 4
%                 perim4 = perim4+1;
%             end
%             if labeled_contours(i,j) == 5
%                 perim5 = perim5+1;
%             end
%             if labeled_contours(i,j) == 6
%                 perim6 = perim6+1;
%             end
%     end
% end
% perims = [perim1 perim2 perim3 perim4 perim5 perim6];
% perim1
% perim2
% perim3
% perim4
% perim5
% perim6


%% count areas
% 
CC = bwconncomp(areaPicture); %connected components
labeled_contours = labelmatrix(CC);
% 
% area1 = 0;
% area2 = 0;
% area3 = 0;
% area4 = 0;
% area5 = 0;
% area6 = 0;
% 
% 
% for i=1:length(labeled_contours(:,1))
%     for j=1:length(labeled_contours(1,:))
%             if labeled_contours(i,j) == 1
%                 area1 = area1+1;
%             end
%             if labeled_contours(i,j) == 2
%                 area2 = area2+1;
%             end
%             if labeled_contours(i,j) == 3
%                 area3 = area3+1;
%             end
%             if labeled_contours(i,j) == 4
%                 area4 = area4+1;
%             end
%             if labeled_contours(i,j) == 5
%                 area5 = area5+1;
%             end
%             if labeled_contours(i,j) == 6
%                 area6 = area6+1;
%             end
%     end
% end
% areas = [area1 area2 area3 area4 area5 area6];
% area1
% area2
% area3
% area4
% area5
% area6


%% Compacity: C = P2 / A 
% compacities = [];
% for i=1:length(areas)
%     compacities(i) = (perims(i)^2)/areas(i);
% end
% 
% compacities


%%
props = regionprops(labeled_contours,'Perimeter','Area','BoundingBox','Orientation');

% for i=1:length(labeled_contours(:,1))
%     for j=1:length(labeled_contours(1,:))
%         if labeled_contours(i,j)==6
%             labeled_contours(i,j) = 255;
%         else
%             labeled_contours(i,j) = 0;
%         end
%     end
% end
% 
% 
% imshow(labeled_contours)

%% info from bounding boxes to position
x1 = (15.5 + 15.5+95.0)/2;
y1 = (31.5 + 31.5+300)/2;
x2 = (124.5 + 124.5+95)/2;
y2 = (32.5 + 32.5+299)/2;
x3 = (232.5 + 232.5+89)/2;
y3 = (49.5 + 49.5+282)/2;
x4 = (333.5 + 333.5+92)/2;
y4 = (65.5 + 65.5+266)/2;
x5 = (441.5 + 441.5+94)/2;
y5 = (16.5 + 16.5+315)/2;
x6 = (550.5 + 550.5+98)/2;
y6 = (0.5 + 0.5+331)/2;