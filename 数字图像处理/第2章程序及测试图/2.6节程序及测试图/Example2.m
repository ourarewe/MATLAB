%����任����
%����һ�����ͼ�񣬽������һ����ΪRGB�����飻
RGB = imread('pic12.jpg'); 
figure
imshow(RGB)
% ����������ͼ��ת��Ϊ�Ҷ�ͼ�񣬽��ûҶ�ͼ�����һ����ΪI�ľ����У�
I= rgb2gray(RGB); 
% ����canny���Ӷ�ͼ����б�Ե��⣻
BW = edge(I,'canny'); 
%�Դ洢��BW�����еĶ�ֵͼ����л���任��������任��Ľ�� ����һ����ΪH   
%�ľ����У��þ����к���size(T)*size(R)���ۼ���������T����Theta���ֵ��R ��RHO 
%��ֵ������任�ռ��ڵ�RHO��� THETA�����С��λΪ0.75��
[H,T,R] = hough(BW,'RhoResolution',0.75,'ThetaResolution',0.75); 
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
      'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;                        
colormap(hot); 
%��ʾ��ֵ�ۼ�����λ�ã�ȡ�ۼ�������ֵ����4����
P  = houghpeaks(H,4)  
% P��:,2����ʾP�����еĵڶ���Ԫ�أ�
x = T(P(:,2)); y = R(P(:,1)); 
% ����ֵ���ڻ���ռ仭����
plot(x,y,'s','color','white');   
