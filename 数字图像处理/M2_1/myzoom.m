function ImOut=myzoom(ImIn,j)
% 功能： 运用双线性插值将图像进行放大
% 输入： ImIn-待放大的灰度图像
%          j-放大因子，将图像放大2j倍
% 输出： ImOut-放大后的图像

A=double(ImIn);
[a,b]=size(A);
 
% 行放大2j倍
x=2^j;
for t=0:x-1
    for k=1:a
        for l=1:b
            if t==x-1
                temp(k*x-t,l)=A(k,l);
            else
                temp(k*x-t,l)=0;
            end
        end
    end
end
 
% 列放大2j倍
for t=0:x-1
    for k=1:a*x
        for l=1:b
            if t==2^j-1
                ImOut(k,l*x-t)=temp(k,l);
            else
                ImOut(k,l*x-t)=0;
            end
        end
    end
end
 
% 对行进行线性插值
for t=1:x-1
    for k=1:a-1
        for l=1:b*x
            ImOut(k*x-t+1,l)=ImOut(k*x-x+1,l)+...
                (ImOut((k+1)*x-x+1,l)-ImOut(k*x-x+1,l))/x*(x-t);
        end
    end
end
 
% 对列进行线性插值
for t=1:x-1
    for k=1:a*x
        for l=1:b-1
            ImOut(k,l*x-t+1)=ImOut(k,l*x-x+1)+...
                (ImOut(k,(l+1)*x-x+1)-ImOut(k,l*x-x+1))/x*(x-t);
        end
    end
end
 
return
