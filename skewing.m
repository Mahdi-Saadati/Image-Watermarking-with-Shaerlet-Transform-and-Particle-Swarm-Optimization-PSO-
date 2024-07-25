function y=skewing(WatermarkingImage,shx,shy)

[m,n,k]=size(WatermarkingImage);
F=[1 shx 0;shy 1 0;0 0 1];
K=maketform('affine',F);

x1=imtransform(WatermarkingImage(:,:,1),K,[m n]);
x2=imtransform(WatermarkingImage(:,:,2),K,[m n]);
x3=imtransform(WatermarkingImage(:,:,3),K,[m n]);

y=cat(3,x1,x2,x3);
