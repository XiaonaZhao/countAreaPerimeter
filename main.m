name = 'G:\20181219_MoS2_CH18-S-Au_HMMT\BrightField\DH_zone3_000_1.jpg';
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

maxP = max([P.Perimeter]);
maxA = max([A.Area]);