function y=flipdim2(x)
x1=flipdim(x(:,:,1),2);
x2=flipdim(x(:,:,2),2);
x3=flipdim(x(:,:,3),2);
y=cat(3,x1,x2,x3);

