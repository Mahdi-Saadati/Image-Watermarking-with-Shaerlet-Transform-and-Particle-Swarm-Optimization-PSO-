function f38(WatermarkingImage,watermark0,LL_R_S2,LL_G_S2,LL_B_S2,Scaling_Factor,m2,n2,Level,j,k,l)

WatermarkingImage = imnoise(WatermarkingImage,'speckle',0.3); 

Watermark_Extraction(WatermarkingImage,watermark0,LL_R_S2,LL_G_S2,LL_B_S2,Scaling_Factor,m2,n2,Level,j,k,l);

end