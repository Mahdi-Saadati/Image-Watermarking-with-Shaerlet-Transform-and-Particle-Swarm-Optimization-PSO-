function y=imcrop(x,a,b)

x1=x(:,:,1);
x2=x(:,:,2);
x3=x(:,:,3);

for i=1:a
    for j=1:b
        x1(i,j)=0;
        x2(i,j)=0;
        x3(i,j)=0;
    end
end

y=cat(3,x1,x2,x3);