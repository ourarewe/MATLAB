clear;

%������Ƶ���е�1��9֡ͼ�񣬲���ʾ
for i=1:9
    %��i�����ͱ�����Ϊ�ַ���
    k=int2str(i);
    %�γɡ�boardk.jpg�����ļ�
    k1=strcat('board',k,'.jpg');
    %����ͼ�񲢴洢��i���������洢��֡��
    B(i,:,:)=imread(k1);
    subplot(3,3,i),C(:,:)=B(i,:,:);imshow(C);
end
%����ÿ֡ͼ��ĻҶ�ֱ��ͼ
    figure
    for i=1:9
        subplot(3,3,i),D(:,:)=B(i,:,:);
        imhist(D);
    end
