%ʹ�ú���������ѵ��������һ��BP����
%���뻹��

%��������
net=newff(minmax(inputmodel),[20,3],{ 'tansig','purelin'},'trainlm'); %����һ����ѵ����ǰ�����磬��ŵ�net�ṹ��

%����ѵ������
net.trainParam.epochs=300; %�趨ѵ������Ϊ300�������ѵ��������ڲ���300�����Ǿ��Ѵﵽָ��ֵ0.00004����ֹͣѵ������������300���ں�δ�ﵽָ��������ѵ�������ﵽ300�ε�ʱ��Ҳֹͣ�����ѵ��
net.trainParam.lr=0.1; %�趨ѵ������Ϊ0.1����ÿ�ε���Ȩ�صĴ�СΪ0.1
net.trainParam.goal=0.00004; %�趨ѵ���������Ϊ0.00004�����ﵽ���ֵʱ��ֹͣѵ��

%BP������ѵ��
[net,tr]=train(net,inputmodel,outputmodel);%ʹ��inputmodel��outputmodel��Ϊѵ��������net����ѵ�����õ��Ľ����ŵ�net��
    
%ѵ������Ԥ��
%an=sim(net, inputmodeltest);%�������磬��inputmodeltest��Ӧ�������ŵ�an��


%ͳ����������Ч��
%ע�������õ���test_simu���ǲ������ݣ����ʽ�ṹ��ǰ���е��񣬵���ǰ���Ŀ����ͳ�ƴ�����֮���޸�Ȩ�أ������õ���test_simu1��ѵ�������ݣ�������ͳ����������Ч����
%     test_simu(:,:)=im2bw(an,0.5);
%     error1=0;
%     for j=1:99
%         a=(test_simu(:,j)~=outputmodeltest(:,j));%��仰�ж�test_simu�е�t:t+2��j���Ƿ��outputmodeltest��j��һ�£�����һ�£���a=[0;0;0]������a��һ����Ϊ1��Ԫ��
%         if ([1 1 1]*a~=0)%��a����Ϊ1��Ԫ�أ������
%             error1=error1+1;%����error�ļ��㹫ʽ
%         end
%     end
