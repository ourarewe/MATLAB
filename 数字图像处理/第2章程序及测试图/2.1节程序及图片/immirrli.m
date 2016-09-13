function outimage=immirrli(Image,direction)
% 功能：实现图像的镜像变换：水平镜像变换、垂直镜像变换、双向镜像变换
% 输入：Image-待变换的灰度图像
%       direction-'horizontal' 水平镜像变换；
%                  -'vertical' 垂直镜像变换；
%                  -'both' 双向镜像变换；
% 输出：outimage-镜像图像

 [M,N]=size(Image);
outimage=zeros(M,N);
if nargin==1
    direction='horizontal';
end
% 计算输出图像
for x=1:M         
    for y=1:N
     switch direction
         case 'horizontal'
             x0=x;y0=N-y+1;    
         case 'vertical'
             x0=M-x+1;y0=y;
         case 'both'
             x0=M-x+1;y0=N-y+1;
     end
% 给新图像中的像素赋值
     outimage(x,y)=Image(x0,y0);      
    end
end
