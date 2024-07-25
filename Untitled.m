clc;
close all;
clear all;

im=imread('C:\18.jpg');
im=rgb2gray(im);
im=im2double(im);

watermark=imread('C:\1.tif');
watermark=im2double(watermark);

[psi,st]= shearletTransformSpect(im,1);
subplot(2,3,1);
title('Orginal image');
imshow(im);
subplot(2,3,2);
title('Aproximation image');
imshow(psi(:,:,1));
subplot(2,3,3);
title('Subband image 1 in Scale 1');
imshow(psi(:,:,2));
subplot(2,3,4);
title('Subband image 2 in Scale 1');
imshow(psi(:,:,3));
subplot(2,3,5);
title('Subband image 3 in Scale 1');
imshow(psi(:,:,4));
subplot(2,3,6);
title('Subband image 4 in Scale 1');
imshow(psi(:,:,5));

% for i=1:5
%     En(i)=entropy(psi(:,:,i));
% end
% [MinEntropy,j]=min(En);  %MinEntropy meghdar Minimum Entropy zirtasavir ast va j shomare an zirtasvir ast
% 
% [m,n]=size(watermark);
% 
% for i=1:m
%     for k=1:n
%         psi(i,k,j)=watermark(i,k);
%     end
% end

%%imshow(psi(:,:,j));

A = inverseShearletTransformSpect(psi,st);
figure;
imshow(A);


[cA,cH,cV,cD] = dwt2(im,'haar');



    