function outimage=imtranslateli(I,deltax,deltay,zoo)
%功能
%输入：I-输入的待处理的图像
%      deltax-沿x轴的偏移量
%      deltay-沿y轴的偏移量
%      zoo-扩大因子
%输出：outimage-输出的平移后的图像
 
[m,n]=size(I);
%画布是否扩大的因子，默认是画布不扩大
zoom=0;             
if nargin>3
%画布扩大
    zoom=zoo;       
end
if zoom
    outimage=zeros(m+deltax,n+deltay);
else
    outimage=zeros(m,n);
end
%处理后图像初始化
[m0 n0]=size(outimage);        
for y=1:n0
    for x=1:m0
        x0=x-deltax;
        y0=y-deltay;
        if x0>=1&&x0<=m&&y0>=1&&y0<=n
%给新图像中的像素赋值
            outimage(x,y)=I(x0,y0);            
        end
    end
end

%显示图像
subplot(121),imshow(I),title('原始图像');    
subplot(122), imshow(uint8(outimage)),title('平移后的图像');
