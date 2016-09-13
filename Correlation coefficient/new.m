function R = new(x,y)
% X，Y为列向量
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