clc,clear all

I=imread('circle.jpg');
%[m.n.l]=size(I);
%if l>1
    I=rgb2gray(I);
%end
BW=edge(I,'sobel');
step_r=1;
step_angle=0.1;
minr=20;
maxr=30;
thresh=0.7;
[hough_space,hough_circle,para]=hough_circle(BW,step_r,step_angle,minr,maxr,thresh);

subplot(221),imshow(I),title('Ô­Í¼')
subplot(222),imshow(BW),title('±ßÔµ')
subplot(223),imshow(hough_circle),title('¼ì²â½á¹û')

    
    