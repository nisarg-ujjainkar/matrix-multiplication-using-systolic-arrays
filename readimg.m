img=imread('img.jpg');
gimg=rgb2gray(img);
nimg=imresize(gimg,[135,240]);

cimg=zeros(137,242);
a=[-1 -1 -1 ;-1 8 -1;-1 -1 -1];
b=zeros(3,3);
for i=2:136
    cimg(i,1)=0;
    cimg(i,242)=0;
    cimg(i,2:241)=nimg(i-1,1:240);
end
pimg=zeros(135,240);
for i=1:135
    for j=1:240
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
pimg=uint8(pimg);
% for i=1:3:135
%     for j=1:3:240
%         b(1,1)=nimg(i,j);
%         b(2,1)=nimg(i+1,j);
%         b(3,1)=nimg(i+2,j);
%         b(1,2)=nimg(i,j+1);
%         b(2,2)=nimg(i+1,j+1);
%         b(3,2)=nimg(i+2,j+1);
%         b(1,3)=nimg(i,j+2);
%         b(2,3)=nimg(i+1,j+2);
%         b(3,3)=nimg(3,j+2);
%         b=b*a;
%         if i==1 && j==1
%             cimg(i,j)=b(2,2);
%         elseif i==1 && j>1
%             cimg(i,(j-1)/3)=b(2,2);
%         elseif i>1 && j==1
%             cimg((i-1)/3,j)=b(2,2);
%         else
%             cimg((i-1)/3,(j-1)/3)=b(2,2);
%         end
%     end
% end