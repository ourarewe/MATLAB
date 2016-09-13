function DD=preprocess(Z,Fs)
if nargin<2, Fs=1000; end
%if nargin<2, ifth=1;end
if min(size(Z))==1, Z=Z(:);end
%Wn1=[10 Fs/4]/(Fs/2);%10-Fs/4 bandpass
Wn1=[40 Fs/4]/(Fs/2);%40-Fs/4 bandpass
%Wn1=[10 30]/(Fs/2);
%在[B,A]=butter(n,wn)中，n是滤波器的阶数，Wn是截止频率，Wn = 截止频率*2/采样频率
[B1,A1]=butter(3,Wn1);
%Wn2=5/(Fs/2); % 5Hz low pass
Wn2=20/(Fs/2); % 20Hz low pass
[B2,A2]=butter(3,Wn2);
%s1=zeros(1,max(size(Z)));
%s1=s1(:);
%s2=s1;
R=zeros(size(Z));
for l=1:min(size(Z))
    a=Z(:,l);
    %a=(a-mean(a))/std(a);
    aa=filtfilt(B1,A1,a);
    %aa=filter(B1,A1,a);
    bb=abs(aa);
    cc=filtfilt(B2,A2,bb);
    %cc=filter(B2,A2,bb);
    DD(:,l)=cc;   
end


