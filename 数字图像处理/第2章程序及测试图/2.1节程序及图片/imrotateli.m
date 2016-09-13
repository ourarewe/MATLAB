function r=imrotateli(I,theta)
% 功能：对输入的灰度图像进行旋转
% 输入：I-待旋转的灰度图像
%       theta-旋转的角度
% 输出：r-旋转后的图像
 
[h0 w0]=size(I);
theta=(theta*pi/180);
cosa=cos(theta);
sina=sin(theta);
 
% 图像原四个顶点坐标
srcx1=-w0*0.5;srcy1=h0*0.5;
srcx2=w0*0.5; srcy2=h0*0.5;
srcx3=-w0*0.5; srcy3=-h0*0.5;
srcx4=w0*0.5; srcy4=-h0*0.5;
 
% 图像旋转后四个顶点坐标
dstx1=cosa*srcx1-sina*srcy1;
dsty1=sina*srcx1+cosa*srcy1;
dstx2=cosa*srcx2-sina*srcy2;
dsty2=sina*srcx2+cosa*srcy2;
dstx3=cosa*srcx3-sina*srcy3;
dsty3=sina*srcx3+cosa*srcy3;
dstx4=cosa*srcx4-sina*srcy4;
dsty4=sina*srcx4+cosa*srcy4;

% 计算旋转后图像的宽度与高度
% 旋转后图像的高为对应顶点纵坐标之差的较大值
h=max(abs(dsty4-dsty1),abs(dsty2-dsty3))+0.5;
% 旋转后图像的宽为对应顶点纵坐标之差的较大值
w=max(abs(dstx4-dstx1),abs(dstx2-dstx3))+0.5;

% 对新图像的高和宽进行四舍五入操作
h=floor(h);
w=floor(w);
 
r=zeros(h,w);
% 计算两个常数
f1=-w*0.5*cosa-h*0.5*sina+0.5*w0;
f2=w*0.5*sina-h*0.5*cosa+0.5*h0;
 
for x=1:w
    for y=1:h
        x0=floor(x*cosa+y*sina+f1);  % 坐标必须为整数
        y0=floor(-x*sina+y+cosa+f2);
 % 对像素进行填充
        if x0>0&&x0<=w0&&y0>0&&y0<=h0
            r(y,x)=I(y0,x0);
        end
    end
end
% 显示原始图像及变换之后的图像
subplot(121), imshow(I);
subplot(122), imshow(r,[]);
