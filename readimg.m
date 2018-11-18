img=imread('sharpen.jpg');
gimg=rgb2gray(img);
%nimg=imresize(gimg,[135,240]);

cimg=zeros(899,1170);
a=[-1 -1 -1 ;-1 8 -1;-1 -1 -1];
b=zeros(3,3);
for i=2:898
    cimg(i,1)=0;
    cimg(i,1170)=0;
    cimg(i,2:1169)=gimg(i-1,1:1168);
end
pimg=zeros(897,1168);
for i=1:897
    for j=1:1168
        b(1,1)=cimg(i,j);
        b(2,1)=cimg(i+1,j);
        b(3,1)=cimg(i+2,j);
        b(1,2)=cimg(i,j+1);
        b(2,2)=cimg(i+1,j+1);
        b(3,2)=cimg(i+2,j+1);
        b(1,3)=cimg(i,j+2);
        b(2,3)=cimg(i+1,j+2);
        b(3,3)=cimg(3,j+2);
        b=b*a;
        pimg(i,j)=b(1,1)+b(1,2)+b(1,3)+b(2,1)+b(2,2)+b(2,3)+b(3,1)+b(3,2)+b(3,3);
    end
end
pimg=de2bi(pimg);
