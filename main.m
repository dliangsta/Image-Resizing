% example usage

I = im2double(imread('union-terrace.jpg')); 
I = shrink(I,100,100);
imshow(I);