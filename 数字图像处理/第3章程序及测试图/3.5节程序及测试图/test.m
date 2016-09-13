k1=strcat('ball1','.jpg');
I=imread(k1);
I=rgb2gray(I);
%I=double(I);
%[r,c]=size(I);
%B(1,:,:)=zeros(r,c);
for i=1:3
    B(i,:,:)=I;
end