x = imread('pic5.jpg');                
[width,height,dim]=size(x);                        
%均值滤波 模块12*12
k=12;                                          
t=0;  
%图像像素类型转换                                        
x = double(x);                                  
y=x;    
%用邻域平均法进行滤波                                      
for i=round(k/2):1:(width-round(k/2)+1)            
    for j=round(k/2):1:(height-round(k/2)+1)       
        for m=i-round(k/2)+1:1:i+round(k/2)-1           
for n=j-round(k/2)+1:1:j+round(k/2)-1 
               s=x(m,n);                     
               t=t+s;                        
           end                              
        end                                
       y(i,j)=round(t/(k*k));                  
       t=0;                                 
end                                   
end                                        
subplot(1,2,1),imshow(uint8(x));              
subplot(1,2,2),imshow(uint8(y));     
