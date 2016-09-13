% 读入RGB图像，并转换成灰度图像
I=imread('pic2.jpg');
I=rgb2gray(I);

% 求灰度图像的行数和列数
[M,N]=size(I);

% 求离散余弦矩阵
P=dctmtx(M);
Q=dctmtx(N);

% 转换数据类型，以便进行矩阵运算
I1=double(I);

% 进行离散傅里叶变换
Idct=P*I1*Q';

% 显示原始图像与变换结果
subplot(121),imshow(I),title('原始图像');
subplot(122),imshow(Idct),title('离散余弦变换后的图像');
