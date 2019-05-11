%function VectorImg = imageTo20X20Gray(file,cropPercent,rotStep)
%img3dmatrix = imread(file);
img3dmatrix= imread('three.jpg');
cropPercent = 0;
rotStep = 0;
imgYIQ = rgb2ntsc(img3dmatrix);
img2D = imgYIQ(:,:,1);
oldsize = size(img2D);

cropDelta = floor((oldsize-min(oldsize)).*(cropPercent/100));
finalsize = oldsize - cropDelta;
cropOrigin = floor(cropDelta /2)+1;
copysize = cropOrigin + finalsize - 1;
croppedImage = img2D(cropOrigin(1):copysize(1), cropOrigin(2):copysize(2));

scale = [20 20] ./ finalsize;
newSize = max(floor(scale .* finalsize),1);
rowIndex = min(round(((1:newSize(1))-0.5)./scale(1)+0.5), finalsize(1));
colIndex = min(round(((1:newSize(2))-0.5)./scale(2)+0.5), finalsize(2));
newImage = croppedImage(rowIndex,colIndex,:);
% Rotate if needed: -1 is CCW, 0 is no rotate, 1 is CW
newAlignedImage = rot90(newImage, rotStep);
% Invert black and white
invertedImage = - newAlignedImage;
% Find min and max grays values in the image
maxValue = max(invertedImage(:));
minValue = min(invertedImage(:));
% Compute the value range of actual grays
delta = maxValue - minValue;
% Normalize grays between 0 and 1
normImage = (invertedImage - minValue) / delta;
% Add contrast. Multiplication factor is contrast control.
contrastedImage = sigmoid((normImage -0.5) * 5);
% Show image as seen by the classifier
imshow(contrastedImage, [-1, 1] );
% Output the matrix as a unrolled vector
VectorImg = reshape(normImage, 1, newSize(1) * newSize(2));

predict(Theta1,Theta2,VectorImg)


