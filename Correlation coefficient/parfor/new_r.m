% X，Y为列向量
function R = new_r(x,y,r)
if nargin<3,r=corr(x,y);end

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