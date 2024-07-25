function y=imfilter_AverageFilter(x,a)

w=ones(2*a+1);
w=w/sum(w(:));

x1=imfilter(x(:,:,1),w);
x2=imfilter(x(:,:,2),w);
x3=imfilter(x(:,:,3),w);
y=cat(3,x1,x2,x3);