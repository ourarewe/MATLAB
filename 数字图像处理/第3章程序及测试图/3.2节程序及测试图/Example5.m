%读取图像并转换成灰度图像
x = imread('diaosu.jpg');                       
x=rgb2gray(x);
[width,height]=size(x);                       

%计算原图直方图
h = zeros(1,256);                                
l=0;                                           
m=1;                                          
for k=0:1:255                                  
    for i=1:1:width                             
        for j=1:1:height                         
            if x(i,j)==k 
l=l+1;                   
            else continue                       
            end                               
        end                                   
    end                                       
    h(m)=l;l=0;                                
    m=m+1;                                  
end                                         

%总像素
nf=width*height;                             
%分布概率
hs=zeros(1,256);                               
for i=1:1:256                                  
    hs(i)=h(i)/nf;                             
end                                          

%累积分布
hp=zeros(1,256);                              
temp=0;                                     
for i=1:1:256                                 
    temp=hs(i)+temp;                        
    hp(i)=temp;                             
end                                        

%新灰度值
g=zeros(1,256);                              
for i=1:1:256                                
    g(i)=round(255*hp(i));                    
end   
                                     
%新像素替换旧像素
for k=1:1:255                               
   for i=1:1:width                           
      for j=1:1:height                      
        if x(i,j)==k 
y(i,j)=g(k);               
        end                               
      end                                 
   end                                    
end
                                       
%图像显示
z=0:1:255;    
                             
%新像素统计
w = zeros(1,256);                           
l=0;                                      
m=1;                                     
for k=0:1:255                              
    for i=1:1:width                         
        for j=1:1:height                     
            if y(i,j)==k 
l=l+1;               
            else continue                   
            end                            
        end                                
    end                                    
    w(m)=l;l=0;                            
    m=m+1;                               
end                                       
subplot(2,2,1),imshow(uint8(x));              
subplot(2,2,2),plot(z,h);                      
subplot(2,2,3),imshow(uint8(y));              
subplot(2,2,4),plot(z,w);  
