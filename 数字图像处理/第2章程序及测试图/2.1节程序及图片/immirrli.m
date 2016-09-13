function outimage=immirrli(Image,direction)
% ���ܣ�ʵ��ͼ��ľ���任��ˮƽ����任����ֱ����任��˫����任
% ���룺Image-���任�ĻҶ�ͼ��
%       direction-'horizontal' ˮƽ����任��
%                  -'vertical' ��ֱ����任��
%                  -'both' ˫����任��
% �����outimage-����ͼ��

 [M,N]=size(Image);
outimage=zeros(M,N);
if nargin==1
    direction='horizontal';
end
% �������ͼ��
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
% ����ͼ���е����ظ�ֵ
     outimage(x,y)=Image(x0,y0);      
    end
end
