%������Ƶ���е�1��9֡ͼ�񣬲���ʾ
for i=1:9
     %��i�����ͱ�����Ϊ�ַ���
    k=int2str(i);
    %�γɡ�ballk.jpg�����ļ�
    k1=strcat('ball',k,'.jpg');
     %����ͼ�񲢴洢��i���������洢��֡��
    B(i,:,:,:)=imread(k1);
    subplot(3,3,i),C(:,:,:)=B(i,:,:,:);imshow(C);
end
    figure
 %����֮֡��ͼ������
for i=1:8
        subplot(3,3,i),D(:,:,:)=B(i+1,:,:,:)-B(i,:,:,:);
        imshow(D);
    end
