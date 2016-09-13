function [Mx,Cx,L,A]=PCA(a)
%功能：用于计算均值、协方差、特征值、特征向量
[m,n]=size(a);
Mx=zeros(m,1);
Nx=zeros(m,1);
Cx=zeros(m,m);
Cx=0;
for i=1:m
  for j=1:n
     Mx(i,1)=Mx(i,1)+a(i,j);
  end
end
Mx=Mx/n;
for j=1:n
  for i=1:m
    Nx(i,1)=a(i,j);
end
  Cx=Cx+(Nx-Mx)*((Nx-Mx)');
end
Cx=Cx/n;
[A,L]=eig(Cx);
[A,L]=taxis(A,L);
