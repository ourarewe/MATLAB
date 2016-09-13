f=imread('5.jpg');
subplot(1,2,1),imshow(f);
title('ԭʼͼ��')
%�Զನ��ͼ�����Ԥ����
X=row(f);
%�����ֵ��Э�������ֵ����������
[Mx,Cx,L,A]=PCA(X);
%��������ֵ�����������ļ�
dlmwrite('pcaL.text',L,'precision','%.6f','newline','pc');
dlmwrite('pcaA.text',L,'precision','%.6f','newline','pc');
B=inv(A);
r_m=double(f(:,:,1));
g_m=double(f(:,:,2));
b_m=double(f(:,:,3));

%�õ���һ���ɷ֡��ڶ����ɷ֡��������ɷ�
KL1=A(1,1)*r_m+A(2,1)*g_m+A(3,1)*b_m;
KL1=uint8(KL1);

KL2=A(1,2)*r_m+A(2,2)*g_m+A(3,2)*b_m;
KL2=uint8(KL2);

KL3=A(1,3)*r_m+A(2,3)*g_m+A(3,3)*b_m;
KL3=uint8(KL3);

subplot(1,2,2);imshow(KL1,[]);
title('��һ���ɷ�')
