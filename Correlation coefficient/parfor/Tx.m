function tx=Tx(beta,x)
%NM�µ�Tx����
xx=beta.*x;
tx=sign(xx).*xx.^2;