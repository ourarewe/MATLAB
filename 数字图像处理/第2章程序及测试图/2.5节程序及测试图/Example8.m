 X=imread('pic16.jpg');
 X=rgb2gray(X);
% 提取分解后的低频和高频系数
 [C,S]=wavedec2(X,2,'bior3.7');
 cA2=appcoef2(C,S,'bior3.7',2);
 [cH2,cV2,cD2]=detcoef2('all',C,S,2);
 [cH1,cV1,cD1]=detcoef2('all',C,S,1);
%从系数C重构第一层低频系数
A1=wrcoef2('a',C,S,'bior3.7',1);
 %从系数C重构第二层低频系数
 A2=wrcoef2('a',C,S,'bior3.7',2);
%从系数C重构第一、二层高频系数
H1=wrcoef2('h',C,S,'bior3.7',1);
 V1=wrcoef2('v',C,S,'bior3.7',1);
D1=wrcoef2('d',C,S,'bior3.7',1);
 H2=wrcoef2('h',C,S,'bior3.7',2);
 V2=wrcoef2('v',C,S,'bior3.7',2);
 D2=wrcoef2('d',C,S,'bior3.7',2);
% 显示
 subplot(241)
imshow(uint8(A1));
 title('低频系数A1');
subplot(242)
 imshow(uint8(H1));
 title('水平细节H1');
subplot(243)
imshow(uint8(V1));
title('垂直细节V1');
 subplot(244)
imshow(uint8(D1));
title('对角细节V1');
subplot(245)
imshow(uint8(H2));
title('水平细节H2');
subplot(246)
imshow(uint8(V2));
title('垂直细节V2');
subplot(247)
imshow(uint8(D2));
title('对角细节V2');
subplot(248)
imshow(uint8(A2));
title('低频A2');
