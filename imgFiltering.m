close all; clear all;

a=imread('bee.png');
grayIm = a;
[row col] = size(grayIm);
figure;
imshow(grayIm);
title('original image')
A=fftshift(fft2(grayIm)); %2D fft
count_pic=2;
% mesh(log(abs(A)))

figure
remove = [0.25 0.5 0.75 0.95];
for i = 1:4
    A1 = zeros(row,col);
    rr = row/2*remove(i)
    rc = col/2*remove(i)
    A1(rr:row-rr,rc:col-rc) = A(rr:row-rr,rc:col-rc);
    
    subplot(4,2,2*i-1)
    contourf(log(abs(A1)))
    xlim([0 row]); ylim([0 col]);
    
    subplot(4,2,2*i)
    imshow(uint8(real(ifft2(fftshift(A1)))))
    title(["% of elements to remove = ",remove(i)])
end