function y=fspecial_GaussianFilter(x,a)

w=fspecial('gaussian',a);

x1=imfilter(x(:,:,1),w);
x2=imfilter(x(:,:,2),w);
x3=imfilter(x(:,:,3),w);
y=cat(3,x1,x2,x3);