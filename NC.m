function nc = NC (pic1,pic2) 
pic1=imread('copyright.bmp');
pic2=imread('watermark.bmp');
[m,n]=size(pic1);
pic2=imresize(pic2, [m n]);
for i=1:m
    for j=1:n 
        nc= corr2(double(pic1),double(pic2))/corr2(abs(double(pic1)),abs(double(pic2)));
    end
end
end