function my_corrNew()
%内容合并到my_corr里，暂时没用
over0=r1>=0; under0=r1<0;
over0=repmat(over0,20,1);
under0=repmat(under0,20,1);
x1(under0)=-x(under0);
x1(over0)=x(over0);
x1=reshape(x1,20,100000);
sx=sort(x1); sy=sort(y);
    
for i=1:N
    r2(i)=r1(i)/corr(sx(:,i),sy(:,i));
    i
end