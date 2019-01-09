%% for RGB pictures
im = imread('DH_Zone2_001_1.jpg');
mainf=imshow(im);
[x, y] = ginput(2);
xlist = int32(x);
ylist = int32(y);
tolerance = 16;
bin_mask = magicwand(im, ylist, xlist, tolerance);
subplot(2, 3, 1); imshow(im);
subplot(2, 3, 4); imshow(bin_mask);

%%
f = medfilt2(bin_mask);
% figure('color','w');
subplot(2, 3, 2); imshow(f);
subplot(2, 3, 5); imshow(bin_mask);
g=imdilate(f,strel('disk',2));
% figure('color','w');
subplot(2, 3, 3); imshow(g);
subplot(2, 3, 6); imshow(bin_mask);

IMG1 = g;
P = regionprops(IMG1, 'Perimeter');  % perimeter
A = regionprops(IMG1, 'Area');  % area
MaxP = max([P.Perimeter])
MaxA = max([A.Area])

%%  deal with pictures from PHOTOSHOP
name = 'DH_zone01_000_1.jpg';
IMG = imread(name);
% th = graythresh(IMG);
% IMG1 = im2bw(IMG, th); %#ok<IM2BW>
IMG1 = im2bw(IMG, 0.97); %#ok<*IM2BW>

IMG2 =~ IMG1; %IMPORTANT STEP
figure;
subplot(1, 2, 1); imshow(IMG1);
subplot(1, 2, 2); imshow(IMG2);
P = regionprops(IMG2, 'Perimeter');  % perimeter
A = regionprops(IMG2, 'Area');  % area

maxP = max([P.Perimeter])
maxA = max([A.Area])