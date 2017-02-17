
% cd into appropriate directory


files = ls();
files = cellstr(files);
length = size(files);
length = length(1,1);
X = [];

% Thresholding approach 

for c = 3:length
    img = imread(files{c});
    img = rgb2gray(img);
    img = im2double(img);
    thresh = multithresh(img,7);
    valuesMax = [thresh max(img(:))];
    [quant8_I_max, index] = imquantize(img,thresh,valuesMax);
    valuesMin = [min(img(:)) thresh];
    quant8_I_min = valuesMin(index);
    %imshow(quant8_I_min);
    img = reshape(quant8_I_min,[1,27556]);
    X = [X;img];   
end



imshow(reshape(X(2,:),[166,166]));


save('name.mat','X');
