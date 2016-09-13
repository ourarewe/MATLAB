% ø…”√Õº£∫coin.jpg   hua6.jpg 
%        test1.jpg  test2.jpg  test3.jpg  test4.jpg

a=imread('coin.jpg');
a=rgb2gray(a);
e=log_edge(a,0.25);
subplot(1,2,1),imshow(a);
subplot(1,2,2),imshow(e);
