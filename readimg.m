img=imread('img.jpg');
gimg=rgb2gray(img);
nimg=imresize(gimg,[135,240]);
op=zeros(3,10800);
for i=1:3: 133
    a=(i-1)*80;
    a=a+1;
    b=a+240-1;
    op(1,a:b)=nimg(i,:);
    op(2,a:b)=nimg(i+1,:);
    op(3,a:b)=nimg(i+2,:);
end