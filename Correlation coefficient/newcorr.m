function R=newcorr(x,y)
% X，Y为横向量
x=x(:); %列向量
y=y(:); %列向量
r=corr(x,y); %Pearson's r
if r>=0
    sx=sort(x); 
    sy=sort(y);
    R=r/corr(sx(:),sy(:));
else
    x=-x;
    sx=sort(x);
    sy=sort(y);
    R=r/corr(sx(:),sy(:));
end