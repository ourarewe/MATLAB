clear;

for i=1:5
    %��i�����ͱ�����Ϊ�ַ���
    k=int2str(i);
    %�γɡ�boardk.jpg�����ļ�
    k1=strcat('board',k,'.jpg');
    %����ͼ�񲢴洢��i���������洢��֡��
    B(i,:,:)=imread(k1);
    % ��ӽ�������
    B(i,:,:)=imnoise(B(i,:,:),'salt & pepper',0.05); 
    subplot(3,3,i),C(:,:)=B(i,:,:);imshow(C);
end

%����֡��ƽ���˲�������ʾ
figure
for i=1:4
    D(:,:,i)=double(B(i,:,:)+B(i+1,:,:))/2;
   subplot(2,2,i)
    imshow(uint8(D(:,:,i)))
end
