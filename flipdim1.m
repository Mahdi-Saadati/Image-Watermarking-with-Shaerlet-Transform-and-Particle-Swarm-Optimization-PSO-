function y=flipdim1(x)
x1=flipdim(x(:,:,1),1);
x2=flipdim(x(:,:,2),1);
x3=flipdim(x(:,:,3),1);
y=cat(3,x1,x2,x3);