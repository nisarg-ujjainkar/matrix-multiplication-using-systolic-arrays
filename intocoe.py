from cv2 import *
from numpy import *

img=imread('img.jpg')
img= cvtColor(img, COLOR_BGR2GRAY)
small=resize(img, (160,90)) 
for i in range(0,160):
    for j in range(0,90):
        small[i][j]=int(small[i][j]*15/128);

f=open("image.coe",'w')
f.write("memory_initialization_radix=2;\n")
f.write("memory_initialization_vector=\n")
for i in range(0,160):
    for j in range(0,90):
        a='{0:04b}'.format(small[i][j])
        f.write(a)
        f.write(',\n')

