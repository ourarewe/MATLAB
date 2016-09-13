function tx=Tx(beta,x)
%NMÏÂµÄTxº¯Êý
xx=beta.*x;
tx=sign(xx).*xx.^2;