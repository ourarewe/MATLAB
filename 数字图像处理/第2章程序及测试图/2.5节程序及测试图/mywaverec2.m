function y=mywaverec2(x,dim)
% 功能： 输入的分解系数矩阵x进行 dim 层重构
% 输入：x ——分解系数矩阵；
%           dim ——重构层数；
% 输出：y ——重构矩阵。
% 绘制分解图像
% 将输入矩阵的数据格式转换为适合显示图像的uint8格式
xd=uint8(x);            
% 求出输入矩阵的行列数
[m,n]=size(x);          
% 对转换矩阵xd进行分界线处理
for i=1:dim             
m=m-mod(m,2);
n=n-mod(n,2);
xd(m/2,1:n)=255;
xd(1:m,n/2)=255;
m=m/2;n=n/2;
end
figure;
% 画出带有分界线的分解图像
subplot(121);imshow(xd);title([ num2str(dim) ' 层小波分解图像']); 
% 重构图像
% 将输入矩阵的数据格式转换回适合数值处理的double格式
xr=double(x);           
% 求出转换矩阵xr的行列数
[row,col]=size(xr);    
% 重构次序是从内层往外层进行，所以先抽取矩阵 xr 的最内层分解矩阵进行重构
for i=dim:-1:1    
 % 重构的内层矩阵的行列数均为矩阵xr的2^(i-1)倍     
tmp=xr(1:floor(row/2^(i-1)),1:floor(col/2^(i-1)));      
% 读取待重构矩阵 tmp 的行列数
[rt1,ct1]=size(tmp);                         
rt=rt1-mod(rt1,2);ct=ct1-mod(ct1,2);
% 将待重构矩阵 tmp 分解为四个部分
rLL=tmp(1:rt/2,1:ct/2);                    
rHL=tmp(1:rt/2,ct/2+1:ct);
rLH=tmp(rt/2+1:rt,1:ct/2);
rHH=tmp(rt/2+1:rt,ct/2+1:ct);
% 将重构结果返回到矩阵 tmp
tmp(1:rt,1:ct)=myidwt2(rLL,rHL,rLH,rHH);              
% 把矩阵 tmp 的数据返回到矩阵 xr 的相应区域，准备下一个外层的重构
xr(1:rt1,1:ct1)=tmp;       
end
% 重构结束后得到的矩阵xr即为输出矩阵 y
y=xr;                   
% 将矩阵xr的数据格式转换为适合显示图像的uint8格式
yu=uint8(xr);            
subplot(122);imshow(yu);title('小波重构图像');
