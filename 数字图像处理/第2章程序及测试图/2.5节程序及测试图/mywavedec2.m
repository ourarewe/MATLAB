function y=mywavedec2(x,dim)
% 功能：对输入图像矩阵 x 进行 dim 层分解，得到相应的分解系数矩阵 y
% 输入：x —— 输入图像矩阵
%           dim —— 分解层数
% 输出：y —— 分解系数矩阵

% 首先规范化输入矩阵，使其行列数均能被 2^dim 整除
x=modmat(x,dim);            
% 画出规范化后的图像
subplot(121);imshow(x);title('原始图像');   
% 求出规范化矩阵x的行列数
[m,n]=size(x);              
% 将矩阵x的数据格式转换为适合数值处理的double格式
xd=double(x);               
for i=1:dim
    xd=modmat(xd,1);
% 小波分解
[dLL,dHL,dLH,dHH]=mydwt2(xd);   
% 将分解系数存入缓存矩阵
tmp=[dLL,dHL;dLH,dHH];          
 % 将缓存矩阵左上角部分的子矩阵作为下一层分解的源矩阵
xd=dLL;                         
% 求出缓存矩阵的行列数
[row,col]=size(tmp);            
% 将缓存矩阵存入输出矩阵的相应行列
y(1:row,1:col)=tmp;             
end
% 将输出矩阵的数据格式转换为适合显示图像的uint8格式
yd=uint8(y);            
% 对矩阵 yd 进行分界线处理，画出分解图像的分界线
for i=1:dim             
    m=m-mod(m,2);
    n=n-mod(n,2);
    yd(m/2,1:n)=255;
    yd(1:m,n/2)=255;
    m=m/2;n=n/2;
end
subplot(122);imshow(yd);title([ num2str(dim) ' 层小波分解图像']); 
