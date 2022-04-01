%% Linear spatial Filtering
i1 = [0 0 0 1 0 0 0 0]; % vector
i2 = [1 2 3 2 0];       % mask

for i=1:(length(i2)-1)
    i1 = [0,i1]
end
for i=1:(length(i2)-1)
    i1 = [i1,0]
end

% CORRELATION
cor = [];
temp = 0;
for i = 1:(length(i1)-length(i2) + 1)
    for j = 1:length(i2)
        temp = temp + i1(i+j-1) * i2(j);
    end
    cor = [cor, temp];
    temp = 0;
end
cor

%CONVOLUTION
i22 = flip(i2);
con = [];
temp = 0;
for i = 1:(length(i1)-length(i22) + 1)
    for j = 1:length(i22)
        temp = temp + i1(i+j-1) * i22(j);
    end
    con = [con, temp];
    temp = 0;
end
con

imfilter(i1,i2,'full')
conv2(i1,i2)

imfilter(i2,i1,'full')
conv2(i2,i1)
%%

f = zeros(512,512);
for i=1:256
    for j= 1:512
        if j < 256
            f(i,j)=255;
        else
            f(i,j)=0;
        end
    end
end

for i=256:512
    for j= 1:512
        if j > 256
            f(i,j)=255;
        else
            f(i,j)=0;
        end
    end
end
f = double(f);
subplot(1,2,1)
imshow(f)

w = ones(32,32);

gd = imfilter(f, w,'replicate'); % replicate, symmetric, circular
subplot(1,2,2)
imshow(gd, []);


