function avi2jpg(avifile,jpgfile,n)
% 功能：将一段AVI视频文件中的视频帧单独存储为静止的图像
% 输入：avifile-需要转换的AVI文件
%       jpgfile-转换后的jpg文件名的前半部分       
%       n-需要提取的前n帧

% 读入AVI文件，数据放入MATLAB Movie格式
mov=aviread(avifile);

% 定位MATLAB Movie中文件的数据
temp=size(mov);
fnum=temp(2);
if n<fnum
    m=n;
else
    m=fnum
end

% 逐帧提取数据，并保存为jpg文件
for i=1:n
    strtemp=strcat(jpgfile,int2str(i),'.jpg');
    imwrite(mov(i).cdata(:,:,:),strtemp)
end
