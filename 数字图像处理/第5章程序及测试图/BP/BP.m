%使用函数建立、训练、仿真一个BP网络
%输入还是

%建立网络
net=newff(minmax(inputmodel),[20,3],{ 'tansig','purelin'},'trainlm'); %建立一个可训练的前馈网络，存放到net结构中

%设置训练参数
net.trainParam.epochs=300; %设定训练周期为300，即如果训练误差限在不到300周期是就已达到指定值0.00004，则停止训练；而若到达300周期后还未达到指定误差，则在训练次数达到300次的时候，也停止网络的训练
net.trainParam.lr=0.1; %设定训练步长为0.1，即每次调整权重的大小为0.1
net.trainParam.goal=0.00004; %设定训练的误差限为0.00004，当达到这个值时，停止训练

%BP神经网络训练
[net,tr]=train(net,inputmodel,outputmodel);%使用inputmodel和outputmodel作为训练样本对net进行训练，得到的结果存放到net中
    
%训练数据预测
%an=sim(net, inputmodeltest);%仿真网络，将inputmodeltest对应的输出存放到an中


%统计弱分类器效果
%注意这里用的是test_simu，是测试数据；表达式结构和前面有点像，但是前面的目的是统计错误了之后修改权重，而且用的是test_simu1，训练用数据；这里是统计弱分类器效果的
%     test_simu(:,:)=im2bw(an,0.5);
%     error1=0;
%     for j=1:99
%         a=(test_simu(:,j)~=outputmodeltest(:,j));%这句话判断test_simu中第t:t+2行j列是否和outputmodeltest中j列一致，若是一致，则a=[0;0;0]，否则a中一定有为1的元素
%         if ([1 1 1]*a~=0)%若a中有为1的元素，则错误
%             error1=error1+1;%误差和error的计算公式
%         end
%     end
