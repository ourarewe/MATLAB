clear;clc;
I=imread('lena.jpg');
 I=rgb2gray(I);
 I=double(I);
 I=I/.255;
[ pos, scale, orient, desc ] = SIFT(I,2,2,ones(size(I)),0.02,10.0,2);