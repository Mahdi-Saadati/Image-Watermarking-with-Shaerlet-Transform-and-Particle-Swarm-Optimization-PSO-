function y=fspecial_BlurringFilter(x,a)

w=fspecial('gaussian', [5 5], a);

x1=imfilter(x(:,:,1),w,'same');
x2=imfilter(x(:,:,2),w,'same');
x3=imfilter(x(:,:,3),w,'same');
y=cat(3,x1,x2,x3);