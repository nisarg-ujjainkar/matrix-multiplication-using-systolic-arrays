a=[8 12 4; 6 13 7; 1 5 15];
b=[1 1 1; -1 8 -1; 1 1 1];
c=b*a;
s=0;
for i=1:3
    for j=1:3
        s=s+c(i,j);
    end
end