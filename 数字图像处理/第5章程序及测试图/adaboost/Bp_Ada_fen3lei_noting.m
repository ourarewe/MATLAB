%这个程序使用强分类器来对三个工具进行分类，inputmodel，inputmodeltest，outputmodel，outputmodeltest分别为输入输出训练和测试样本，K=10个弱分类器，即有10个BP网络
%inputmodel训练样本的输入
%outputmodel训练样本的输出
%inputmodeltest测试样本的输入
%outputmodeltest测试样本的期望输出

%% 权重初始化
[mm,nn]=size(inputmodel);%mm存放训练用输入样本的行数，nn存放训练用输入样本列数
D(1,:)=ones(1,nn)/nn;%D为一个1行nn列的矩阵，里面每个元素都是1/nn；D实际上就是分布权值



%% 弱分类器分类
K=10;%总共有10个弱分类器，每个BP网络作为一个弱分类器
for i=1:K %i为当前的弱分类器
    
    t=3*i-2;%定义一个变量t，方便后面矩阵合成和结果统计，这里其实可以用训练样本来确定，比如输出是a*b，则t=a*i-(a-1)
    error(i)=0;%error(i)是每个弱分类器的预测序列误差，即识别错误
    
    %BP神经网络构建
    net=newff(minmax(inputmodel),[20,3],{'tansig','purelin'},'trainlm'); %建立一个可训练的前馈网络，存放到net结构中
    net.trainParam.epochs=300; %设定训练周期为300，即如果训练误差限在不到300周期是就已达到指定值0.00004，则停止训练；而若到达300周期后还未达到指定误差，则在训练次数达到300次的时候，也停止网络的训练
    net.trainParam.lr=0.1; %设定训练步长为0.1，即每次调整权重的大小为0.1
    net.trainParam.goal=0.00004; %设定训练的误差限为0.00004，当达到这个值时，停止训练
    
    %BP神经网络训练
    [net,tr]=train(net,inputmodel,outputmodel);%使用inputmodel和outputmodel作为训练样本对net进行训练，得到的结果存放到net中
    
    %训练数据预测
    an1=sim(net,inputmodel);%仿真网络，将inputmodel对应的输出存放到an1中
    ts1(t:t+2,:)=an1;%ts1存放预测序列的原始数据
    test_simu1(t:t+2,:)=im2bw(an1,0.5);%test_simu1就是预测序列，它是一个3*i行nn列矩阵，使用im2bw将数据变成0或1，得到的数据结果是一个前面3i-3行都是0，后面3行为一个0或1元素向量序列的结果，其值对应网络的输出
    
    %测试数据预测
    an=sim(net,inputmodeltest);%仿真网络，将inputmodeltest对应的输出存放到an中
    ts(t:t+2,:)=an;%ts存放弱分类函数的原始数据
    test_simu(t:t+2,:)=im2bw(an,0.5);%test_simu其实就是一个弱分类器得到的结果，test_simu是一个3*i行99列矩阵，使用im2bw将数据变成0或1，得到的数据结果是一个前面3i-3行都是0，后面3行为一个0或1元素向量序列的结果，其值对应网络的输出
    
    %统计错误样本数
    for j=1:nn %nn是列数
        a=(test_simu1(t:t+2,j)~=outputmodel(:,j));%判断网络的预测序列和对应的输出是否一致，将结果存放在a中，若相等，则a=[0;0;0]，否则a中有为1的元素
        if ([1 1 1]*a~=0)%若a中有为1的元素，则错误
            error(i)=error(i)+D(i,j);%误差和error的计算公式
        end
    end
    
    %弱分类器i权重
    at(i)=0.5*log((1-error(i))/error(i));%at(i)为每个弱分类器的预测序列权重，该式为预测序列权重计算公式
    
    %更新D值
    for j=1:nn
        D(i+1,j)=D(i,j)*exp(-at(i)*(test_simu1(t:t+2,j))'*an1(:,j));%D是一个掌管测试数据权重的因子，掌管数据的分布的权值，根据预测序列的权重at(i)来调整下一轮训练样本的权重
    end
    
    %D值归一化
    Dsum=sum(D(i+1,:));
    D(i+1,:)=D(i+1,:)/Dsum;
    
end



%% 强分类器分类结果
for i=1:K
    ii=3*i-2;
    at2(ii:ii+2)=at(i);%把at每个元素复制三个，变成一个1*30的矩阵at2
end
at3=at2';
for i=1:98
    at3=[at3 at2'];%在at2的基础上生成一个与目标输出一样大小30*99的矩阵at3
end
output1=at3.*ts;%将at3中元素与ts中元素逐元素相乘
output2=zeros(3,99);%生成一个3x99的零矩阵
for j=1:3%3是输出向量的元素个数
    for i=1:K%K是所要分成的组，10组数据，来自10个弱分类器
        ii=3*i-(3-j);%为了把output1中的1,4,7,10...;2,5,8,11...;3,6,9,12...这些行提取出来相加，得到一个3*99的矩阵
        output2(j,:)=output2(j,:)+output1(ii,:);%output2用来存放每3行相加后的元素，为一个3*99的矩阵
    end
end 
output3=0.1*output2;%10个弱分类器累加，最后结果应该缩小10倍
output=im2bw(output3,0.33);%得到的output应该是一个在结构上和outputmodeltest一致，即3*99的矩阵



%% 分类结果统计

%统计强分类器每类分类错误个数
kkk1=0;
kkk2=0;
kkk3=0;
for j=1:99%99是输出的列数
    b=(output(:,j)~=outputmodeltest(:,j));
    if j>=1&&j<=33;
        if ([1 1 1]*b~=0)
            kkk1=kkk1+1;%统计第一类的识别错误数
        end
    end
    if j>=34&&j<=66;
        if ([1 1 1]*b~=0)
            kkk2=kkk2+1;%统计第二类的识别错误数
        end
    end
     if j>=67&&j<=99;
        if ([1 1 1]*b~=0)
            kkk3=kkk3+1;%统计第三类的识别错误数
        end
    end   
end

kkk1
kkk2
kkk3
disp('第一类分类错误  第二类分类错误  第三类分类错误  总错误');
%窗口显示
disp([kkk1 kkk2 kkk3 kkk1+kkk2+kkk3]);

plot(output)
hold on
plot(outputmodeltest,'g')


%统计弱分类器效果
%注意这里用的是test_simu，是测试数据；表达式结构和前面有点像，但是前面的目的是统计错误了之后修改权重，而且用的是test_simu1，训练用数据；这里是统计弱分类器效果的
for i=1:K
    error1(i)=0;
    t=3*i-2;
    for j=1:99
        a=(test_simu(t:t+2,j)~=outputmodeltest(:,j));%这句话判断test_simu中第t:t+2行j列是否和outputmodeltest中j列一致，若是一致，则a=[0;0;0]，否则a中一定有为1的元素
        if ([1 1 1]*a~=0)%若a中有为1的元素，则错误
            error1(i)=error1(i)+1;%误差和error的计算公式
        end
    end
end
disp('统计弱分类器分类效果');
error1

disp('强分类器分类误差率') 
(kkk1+kkk2+kkk3)/99

disp('弱分类器分类误差率')
(sum(error1)/(K*99))

