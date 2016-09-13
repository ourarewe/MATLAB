f=imread('5.jpg');
subplot(1,2,1),imshow(f);
title('原始图像')
%对多波段图像进行预处理
X=row(f);
%计算均值、协方差、特征值、特征向量
[Mx,Cx,L,A]=PCA(X);
%保存特征值、特征向量文件
dlmwrite('pcaL.text',L,'precision','%.6f','newline','pc');
dlmwrite('pcaA.text',L,'precision','%.6f','newline','pc');
B=inv(A);
r_m=double(f(:,:,1));
g_m=double(f(:,:,2));
b_m=double(f(:,:,3));

%得到第一主成分、第二主成分、第三主成分
KL1=A(1,1)*r_m+A(2,1)*g_m+A(3,1)*b_m;
KL1=uint8(KL1);

KL2=A(1,2)*r_m+A(2,2)*g_m+A(3,2)*b_m;
KL2=uint8(KL2);

KL3=A(1,3)*r_m+A(2,3)*g_m+A(3,3)*b_m;
KL3=uint8(KL3);

subplot(1,2,2);imshow(KL1,[]);
title('第一主成分')
