function hsi=rgb2hsi(rgb)
% 功能：从RGB空间转换到HSI空间
% 提取RGB颜色空间中的每一个分量
rgb=im2double(rgb);
r=rgb(:,:,1);g=rgb(:,:,2);b=rgb(:,:,3);
% 实现转换操作
num=0.5*((r-g)+(r-b));
den=sqrt((r-g).*(r-g)+(r-b).*(g-b));
theta=acos(num./(den+eps));
 
H=theta;
H(b>g)=2*pi-H(b>g);
H=H/(2*pi);
 
num=min(min(r,g),b);
den=r+g+b;
den(den==0)=eps;
S=1-3.*num./den;
H(S==0)=0;
I=(r+g+b)/3;
 
% 将H、S和I三个分量合并
hsi=cat(3,H,S,I);
