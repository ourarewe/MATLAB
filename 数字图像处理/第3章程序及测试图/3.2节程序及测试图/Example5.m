%��ȡͼ��ת���ɻҶ�ͼ��
x = imread('diaosu.jpg');                       
x=rgb2gray(x);
[width,height]=size(x);                       

%����ԭͼֱ��ͼ
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

%������
nf=width*height;                             
%�ֲ�����
hs=zeros(1,256);                               
for i=1:1:256                                  
    hs(i)=h(i)/nf;                             
end                                          

%�ۻ��ֲ�
hp=zeros(1,256);                              
temp=0;                                     
for i=1:1:256                                 
    temp=hs(i)+temp;                        
    hp(i)=temp;                             
end                                        

%�»Ҷ�ֵ
g=zeros(1,256);                              
for i=1:1:256                                
    g(i)=round(255*hp(i));                    
end   
                                     
%�������滻������
for k=1:1:255                               
   for i=1:1:width                           
      for j=1:1:height                      
        if x(i,j)==k 
y(i,j)=g(k);               
        end                               
      end                                 
   end                                    
end
                                       
%ͼ����ʾ
z=0:1:255;    
                             
%������ͳ��
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
