function R=newcorr(x,y)
% X��YΪ������
x=x(:); %������
y=y(:); %������
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