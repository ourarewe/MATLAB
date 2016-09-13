function[A,L]=taxis(A,L)
%功能：对特征向量、特征值进行排序
 [m,n]=size(L);
 for i=1:m-1
    for j=i+1:m
      if L(i,i)<L(j,j)
         temp=L(i,i);
         L(i,i)=L(j,j);
         L(j,j)=temp;
         for j0=1:m
             temp0=A(j0,i);
             A(j0,i)=A(j0,j);
             A(j0,j)=temp0;
         end
      end
    end
end
L=L;
