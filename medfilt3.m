function y=medfilt3(x,a)

x1=medfilt2(x(:,:,1),[a,a]);
x2=medfilt2(x(:,:,2),[a,a]);
x3=medfilt2(x(:,:,3),[a,a]);
y=cat(3,x1,x2,x3);