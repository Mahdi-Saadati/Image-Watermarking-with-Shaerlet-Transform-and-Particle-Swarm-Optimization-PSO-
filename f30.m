function f30(WatermarkingImage,watermark0,LL_R_S2,LL_G_S2,LL_B_S2,Scaling_Factor,m2,n2,Level,j,k,l)

imwrite(WatermarkingImage,'K:\Compress_Image.jpeg','Mode','lossy','Quality',90);   %JPEG Compression (JPEG)
WatermarkingImage = imread('K:\Compress_Image.jpeg');     %JPEG Compression (JPEG)
WatermarkingImage=im2double(WatermarkingImage); 

Watermark_Extraction(WatermarkingImage,watermark0,LL_R_S2,LL_G_S2,LL_B_S2,Scaling_Factor,m2,n2,Level,j,k,l);

end