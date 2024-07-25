%%Watermark Embedding

clc;
close all;
clear all;

Scaling_Factor=0.05;

Hostimage=imread('C:\18.jpg');
Hostimage=rgb2gray(Hostimage);
Hostimage=im2double(Hostimage);

watermark=imread('c:\1.tif');
watermark=im2double(watermark);

[psi,st]= shearletTransformSpect(Hostimage,1);

%%
for i=2:5
    En(i)=entropy(st(:,:,i));
end
[MinEntropy,j]=min(En(2:5));  %MinEntropy meghdar Minimum Entropy zirtasavir ast va j shomare an zirtasvir ast
% 
% [m,n]=size(Hostimage);
% watermark2=imresize(watermark,[m,n]);
% st(i,k,j+1)=watermark2(i,k)*Scaling_Factor+st(i,k,j+1);

% [m,n]=size(watermark);
% 
% for i=1:m
%     for k=1:n
%         st(i,k,j+1)=watermark(i,k);
%     end
% end

%%


IR_LL=psi(:,:,1);
[IR_LL_U,IR_LL_S,IR_LL_V]=svd(IR_LL);

[m,n]=size(Hostimage);

watermark=imresize(watermark,[m,n]);

IR_LL_S2=watermark*Scaling_Factor+IR_LL_S;

[IR_LL_S2_U,IR_LL_S2_S,IR_LL_S2_V]=svd(IR_LL_S2);

IR_LL_new=IR_LL_U*IR_LL_S2_S*IR_LL_V';

psi(:,:,1)=IR_LL_new;

A=inverseShearletTransformSpect(psi,st);

subplot(1,2,1);
imshow(Hostimage);
title('Orginal Image');
subplot(1,2,2);
imshow(A);
title('Watermarking Image');




%%Watermark Extracting
% [psi,st]= shearletTransformSpect(A,1);
% IR_LL_new=psi(:,:,1);
% [IR_LL_U,IR_LL_S,IR_LL_V]=svd(IR_LL_new);
% IR_LL=IR_LL_U*IR_LL_S*IR_LL_V';
% 
% psi(:,:,1)=IR_LL;
% 
% B=inverseShearletTransformSpect(psi,st);
% 
% IR_LL_S2=IR_LL_S2_U*IR_LL_S2_S*IR_LL_S2_V';
% 
% Extract_watermark=(IR_LL_S2-IR_LL_S)/Scaling_Factor;
% 
% figure;
% subplot(1,2,1);
% imshow(Extract_watermark);
% title('Extracting watermark');
% subplot(1,2,2);
% imshow(B);
% title('Extracting Image watermark');
