function r=mycorr(x,y)
N=size(y,2);
r=zeros(1,N);
parfor i=1:N
    r(i)=corr(x,y(:,i));
end