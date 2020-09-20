clc
clear all
% 1.提取彩色图像RGB通道
% 1. Extract color image RGB channel
RGB_image = imread('eye1.jpg');
figure(1);
subplot(2,2,1);imshow(RGB_image);
title('the original RGB image');
r = RGB_image(:,:,1);
subplot(2,2,2);imshow(r);
title('the red component of a color image');

g = RGB_image(:,:,2);
subplot(2,2,3);imshow(g);
title('the green component of a color image');

b = RGB_image(:,:,3);
subplot(2,2,4);imshow(b);
title('the blue component of a color image');

% 2. 对绿色通道进行均值滤波
% 2. Mean filtering is performed on the green channel
f = g;
figure(2);
subplot(1,2,1); imshow(f); title('the original image');
f1 = imnoise(f, 'gaussian', 0.002, 0.008); % add some gaussian noise
subplot(1,2,2);imshow(f1);title('graph with gaussian noise');
k1 = floor(3/2)+1;
k2 = floor(3/2)+1;
X = f1;
[M, N] = size(X);
Y =  unit8(zeros(M, N,1));
% Y = zeros(M, N);
funBox = zeros(3, 3);
for i = 1 ; M-3
    for j = 1 ; N-3
        funBox=X(i:i+3, j:j+3);
        s = sum(funBox(:));
        h = s/9;
        Y(i+k1, j+k2) = h;
    end
end
Y = Y/255;
% subplot(1,2,2); 
imshow(Y); title('Mean filtering');

















